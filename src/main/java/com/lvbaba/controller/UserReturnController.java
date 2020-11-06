package com.lvbaba.controller;

import com.lvbaba.entity.User;
import com.lvbaba.entity.Userorder;
import com.lvbaba.service.UserOrderService;
import com.lvbaba.utli.UserbLocker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author DBY
 * @date 2020/11/5 13:31
 */
@Controller
public class UserReturnController {
    @Resource
    private UserOrderService userOrderService;
    @UserbLocker
    @RequestMapping("/toUserOrderRecordView.do")
    public String toUserOrderRecordView(HttpSession session, Model model){
        User user = (User) session.getAttribute("user");
        List<Userorder> userorderList = userOrderService.queryUserOrdersByUserId(user.getuId());
        model.addAttribute("userorderList",userorderList);
        return "userOrderRecordView";
    }

}
