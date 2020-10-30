package com.lvbaba.controller;

import com.lvbaba.entity.User;
import com.lvbaba.entity.Userinfo;
import com.lvbaba.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author DBY
 * @date 2020/10/29 16:47
 */
@Controller
public class OrderController {
    @Resource
    private UserService userService;

    @RequestMapping("/showConfirmOrder.do")
    public ModelAndView showConfirmOrder(HttpSession session){
        User user = (User) session.getAttribute("user");
        ModelAndView mv = new ModelAndView("confirmOrderView");
//        if (user!=null) {
//            List<Userinfo> userinfoList = userService.queryAllByUid(new Userinfo(user.getuId()));
        Userinfo userinfo = new Userinfo();
        userinfo.setuId(1);
        List<Userinfo> userinfoList = userService.queryAllByUid(userinfo);
            mv.addObject("userinfoList", userinfoList);
//        }
        return mv;
    }

    @RequestMapping("/updateUserInfo.do")
    @ResponseBody
    public String updateUserInfo(Userinfo userinfo){
        System.out.println(userinfo);
        boolean flag = userService.updateUserInfoById(userinfo);
        return ""+flag;
    }

    @RequestMapping("/addUserInfo.do")
    @ResponseBody
    public String addUserInfo(Userinfo userinfo,HttpSession session){
//        User user = (User) session.getAttribute("user");
//        userinfo.setuId(user.getuId());
        userinfo.setuId(1);
        boolean flag = userService.insertUserInfo(userinfo);
        return ""+flag;
    }
}
