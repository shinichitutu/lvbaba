package com.lvbaba.controller;

import com.lvbaba.entity.User;
import com.lvbaba.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author DBY
 * @date 2020/10/16 17:29
 */
@Controller
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/toLoginView.do")
    public String toLoginView(){
        return "login";
    }

    @RequestMapping("/testUserName.do")
    @ResponseBody
    public String testUserName(String userName){
        User user1 = new User();
        user1.setUUsername(userName);
        User user = userService.queryByUserName(user1);
        if (user==null){
            return "true";
        }else{
            return "false";
        }
    }

    @RequestMapping("/login.do")
    public String login(User user, Model model, HttpSession session){
        User user1 = userService.queryByUserName(user);
        if (user1.getUPassword().equals(user.getUPassword())){
            session.setAttribute("user",user1);
            return "forward:index.jsp";
        }else{
            model.addAttribute("loginError","账号或密码有误");
            return "login";
        }
    }


}
