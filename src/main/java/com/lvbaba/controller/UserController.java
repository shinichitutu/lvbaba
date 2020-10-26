package com.lvbaba.controller;

import com.lvbaba.entity.Admin;
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
        user1.setuUsername(userName);
        User user = userService.queryByUserName(user1);
        if (user==null){
            return "true";
        }else{
            return "false";
        }
    }

    @RequestMapping("/login.do")
    @ResponseBody
    public String login(User user, Model model, HttpSession session){
        User user1 = userService.queryByUserName(user);
        System.out.println(user1);
        if (user1.getuPassword().equals(user.getuPassword())){
            session.setAttribute("user",user1);
            return "redirect:index.jsp";
        }else{
            model.addAttribute("loginError","账号或密码有误");
            return "login";
        }
    }
    @RequestMapping("/adminLogin.do")
    public String adminLogin(Admin admin, Model model, HttpSession session,String adPassword){
        System.out.println(admin);
        if (admin.getAdName().equals("admin")&&admin.getAdPassword().equals("admin")){
            session.setAttribute("admin",admin);
            return "admin";
        }else {
            model.addAttribute("error","账户或密码有误");
            return "login";
        }
    }

}
