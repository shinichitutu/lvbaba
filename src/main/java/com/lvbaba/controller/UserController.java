package com.lvbaba.controller;

import com.lvbaba.entity.Admin;
import com.lvbaba.entity.User;
import com.lvbaba.entity.Userinfo;
import com.lvbaba.service.UserService;
import com.lvbaba.utli.UserbLocker;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author DBY
 * @date 2020/10/16 17:29
 */
@Controller
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/index.do")
    public String returnIndex() {
        return "../../index";
    }

    @RequestMapping("/toLoginView.do")
    public String toLoginView(String auto) {
        System.out.println(auto);
        return "login";
    }

    @GetMapping(value = "userCenter",produces = MediaType.APPLICATION_ATOM_XML_VALUE)

    @UserbLocker
    @RequestMapping("/userCenter.do")
    public String userCenter(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Userinfo userinfo = new Userinfo();
        userinfo.setuId(user.getuId());
        List<Userinfo> list = userService.queryAllByUid(userinfo);
        model.addAttribute("user", user);
        model.addAttribute("userinfoList", list);
        return "userCenter";
    }

    @RequestMapping("/testUserName.do")
    @ResponseBody
    public String testUserName(String uUsername) {
        User user1 = new User();
        user1.setuUsername(uUsername);
        User user = userService.queryByUserName(user1);
        if (user == null) {
            return "true";
        } else {
            return "false";
        }
    }

    @RequestMapping("/login.do")
    @ResponseBody
    public String login(User user, HttpSession session, String auto) {
        System.out.println(auto);
        User user1 = userService.queryByUserName(user);
        if (null != user1.getuPassword() && user1.getuPassword().equals(user.getuPassword())) {
            session.setAttribute("user", user1);
            return "true";
        } else {
            return "false";
        }
    }

    @RequestMapping("/register.do")
    @ResponseBody
    public String register(User user, Model model, HttpSession session) {
        boolean flag = userService.registerUser(user);
        return "" + flag;
    }

    @RequestMapping("/adminLogin.do")
    public String adminLogin(Admin admin, Model model, HttpSession session, String adPassword) {
        if (admin.getAdName().equals("admin") && admin.getAdPassword().equals("admin")) {
            session.setAttribute("admin", admin);
            return "admin";
        } else {
            model.addAttribute("error", "账户或密码有误");
            return "login";
        }
    }

    @RequestMapping("/userMain.do")
    public String userMain() {
        return "userMain";
    }

    @RequestMapping("/adminMain.do")
    public String adminMain() {
        return "admin";
    }

    @RequestMapping("/home.do")
    public String testHome() {
        return "indexcopy";
    }

    @RequestMapping("/upLoadFile.do")
    public String upLoadFile(MultipartHttpServletRequest request) {
        return "";
    }

    @UserbLocker
    @RequestMapping("userRecharge.do")
    public String userRecharge() {
        return "recharge";
    }

    /*recharge 充值*/
    @UserbLocker
    @RequestMapping("recharge.do")
    public String recharge(Model model, Integer balance, HttpSession session) {
        User user = (User) session.getAttribute("user");
        user.setBalance(balance);
        if (userService.updateUser(user)) {
            model.addAttribute("success", "充值成功");
        } else {
            model.addAttribute("error", "充值失败");
        }
        user = userService.queryByUserName(user);
        session.setAttribute("user", user);
        return "recharge";
    }

    /*退出登录*/
    @UserbLocker
    @RequestMapping("/loginOut.do")
    public String loginOut(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        session.removeAttribute("user");
        return "../../index";
    }
}
