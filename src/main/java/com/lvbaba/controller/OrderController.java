package com.lvbaba.controller;

import com.lvbaba.entity.*;
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
import java.util.List;

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

    @RequestMapping("/showConfirmOrder.do")
    public ModelAndView showConfirmOrder(HttpSession session) {
        User user = (User) session.getAttribute("user");
        ModelAndView mv = new ModelAndView("confirmOrderView");
     if (user!=null) {
         List<Userinfo> userinfoList = userService.queryAllByUid(new Userinfo(user.getuId()));
/*        Userinfo userinfo = new Userinfo();
        userinfo.setuId(1);
        List<Userinfo> userinfoList = userService.queryAllByUid(userinfo);*/
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
}
