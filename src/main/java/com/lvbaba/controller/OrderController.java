package com.lvbaba.controller;

import com.lvbaba.entity.*;
import com.lvbaba.service.OrderDetailService;
import com.lvbaba.service.TourService;
import com.lvbaba.service.UserOrderService;
import com.lvbaba.service.UserService;
import com.lvbaba.utli.Util;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

/**
 * @author DBY
 * @date 2020/10/29 16:47
 */


@Controller
public class OrderController {
    @Resource
    private UserService userService;
    @Resource
    private TourService tourService;
    @Resource
    private UserOrderService userOrderService;
    @Resource
    private OrderDetailService orderDetailService;


    @RequestMapping("/showConfirmOrder.do")
    public ModelAndView showConfirmOrder(HttpSession session) {
        User user = (User) session.getAttribute("user");
        ModelAndView mv = new ModelAndView("confirmOrderView");

     if (user!=null) {
         List<Userinfo> userinfoList = userService.queryAllByUid(new Userinfo(user.getuId()));
        mv.addObject("userinfoList", userinfoList);
    }

        return mv;
    }

    @RequestMapping("/updateUserInfo.do")
    @ResponseBody
    public String updateUserInfo(Userinfo userinfo) {
        boolean flag = userService.updateUserInfoById(userinfo);
        return "" + flag;
    }

    @RequestMapping("/addUserInfo.do")
    @ResponseBody
    public String addUserInfo(Userinfo userinfo, HttpSession session) {
        User user = (User) session.getAttribute("user");
        userinfo.setuId(user.getuId());
        boolean flag = userService.insertUserInfo(userinfo);
        return "" + flag;
    }


    @RequestMapping("/returnUserOrder.do")

    public String returnUserOrder(Long orderId, Model model) {

        boolean flag = userOrderService.returnOrder(orderId);
        if (flag) {
            Integer tourId = (int) userOrderService.queryOne(new Userorder(orderId)).getTourId();
            tourService.updateTourStatus(tourId);
            model.addAttribute("returnUserOrderInfo", "退款成功");
        } else {
            model.addAttribute("returnUserOrderInfo", "退款失败");
        }

        return "forward:toUserOrderRecordView.do";
    }


    @RequestMapping("/createOrder.do")
    public String createNewOrder(String userIds, Model model, String tourId, String total, String person, String roomNum, String roomId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        /*判断余额是否充足*/
        boolean flag = userService.isBalanceEnough(user, Double.valueOf(total));

        if (flag) {
            /*扣款*/
            user.setBalance(Double.valueOf(total) * (-1));
            userService.updateUser(user);
            /*获取时间，生成订单*/
            String time = Util.getCurrentTime();
            Userorder userorder = new Userorder(user.getuId(), Long.valueOf(tourId), Double.valueOf(total), "待成团", time, time, Long.valueOf(roomId), Long.valueOf(roomNum), Long.valueOf(person));
            userOrderService.insertUserorder(userorder);
            Userorder userorder1 = new Userorder();
            userorder1.setOrderTime(time);

            Userorder userorder2 = userOrderService.query(userorder1).get(0);
            long oId = userorder2.getOrderId();

            String[] str = userIds.split(",");
            ArrayList<Long> list = new ArrayList<>();
            for (int i = 0; i < str.length; i++) {
                list.add(Long.valueOf(str[i]));
            }

            Orderdetail orderdetail = new Orderdetail();
            Userinfo userinfo = new Userinfo();

            for (Long l : list) {
                userinfo = userService.queryUserInfoByUiId(l);
                orderdetail.setOrderId(oId);
                orderdetail.setOdIdcard(userinfo.getIdcard());
                orderdetail.setOdPerson(userinfo.getPerson());
                orderdetail.setOdPhone(userinfo.getPhone());
                orderDetailService.insertOrderDetail(orderdetail);
            }
            /*进行后台票务数据的更改*/
            userOrderService.addOrder(oId);
            tourService.updateTourStatus(Integer.valueOf(tourId));
            model.addAttribute("success", "支付成功");
        } else {
            model.addAttribute("error", "余额不足");
        }
        return "payResult";
    }
}
