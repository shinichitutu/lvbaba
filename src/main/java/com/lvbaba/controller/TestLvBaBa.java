package com.lvbaba.controller;

import com.lvbaba.entity.Comment;
import com.lvbaba.entity.Tour;
import com.lvbaba.entity.Userorder;
import com.lvbaba.service.CommentService;
import com.lvbaba.service.TourService;
import com.lvbaba.service.UserOrderService;
import com.lvbaba.utli.Util;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.text.ParseException;

/**
 * Created by YY on 2020/11/5.
 */
@Controller
public class TestLvBaBa {
    @Resource
    private UserOrderService userOrderService;
    @Resource
    private TourService tourService;
    @Resource
    private CommentService commentService;
    @RequestMapping("/test.do")
    public String test(){
        return "test";
    }
    /*查询订单*/
    @RequestMapping("/orderInquiry.do")
    public String orderInquiry(){
        return "test";
    }
    /*添加评论*/
    @RequestMapping("/createComment.do")
    public String createComment(Userorder userorder, Comment comment, Model model){
        userorder =userOrderService.queryOne(userorder);
        /**
         * 根据用户订单查询产品
         */
        Tour tour=new Tour();
        tour.setTourId(userorder.getTourId());
        tour=tourService.query(tour);
        /**
         * 向评论插入产品id 用户id
         */
        comment.setProductId(tour.getProductId());
        comment.setuId(userorder.getuId());
        if (commentService.insertCommentByUid(comment)){
            model.addAttribute("success","评论成功");
        }else {
            model.addAttribute("error","评论失败");
        }
        return "test";
    }
    /*退货*/
    @RequestMapping("/refund.do")
    public String refund(Userorder userorder, Model model) throws ParseException {
        userorder=userOrderService.queryOne(userorder);
        Tour tour=new Tour();
        tour.setTourId(userorder.getTourId());
        tour=tourService.query(tour);
        model.addAttribute("error", Util.refund(tour));
        return "test";
    }
}
