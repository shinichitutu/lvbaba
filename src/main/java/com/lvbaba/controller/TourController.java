package com.lvbaba.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.entity.*;
import com.lvbaba.service.*;
import com.lvbaba.utli.Util;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;
import java.io.IOException;
import java.util.List;

/**
 * Created by YY on 2020/10/26.
 *  旅行团
 */

@Controller
public class TourController {
    @Resource
    private TourService tourService;
    @Resource
    private TransportationService transportationService;
    @Resource
    private ProductService productService;
    @Resource
    private AreaService areaService;
    @Resource
    private HotelService hotelService;
    @Resource
    private UserOrderService userOrderService;
    @Resource
    private CommentService commentService;
    @RequestMapping("/showTour.do")
    public String showTour(Model model,Tour tour,String page) {
        Tour tour1 =new Tour();
        tour1.setProductId(tour.getProductId());

        if (page==null){
            page="1";
        }

        PageHelper.startPage(Integer.valueOf(page),5);
        List<Tour> tours1=tourService.queryByPid(tour1);
        PageInfo<Tour> tourPageInfo = new PageInfo<>(tours1);
        model.addAttribute("page",Integer.valueOf(page));
        model.addAttribute("pages",tourPageInfo.getPages());
        model.addAttribute("tours",tours1);
        Product product = new Product();
        product.setProductId(tour.getProductId());
        Product product1 = productService.query(product);
        model.addAttribute("product",product1);
        return "showTours";
    }

    @RequestMapping("/userShowTour.do")
    public String userShowTour(Model model,Tour tour,String page){
        if (tour==null){
            tour =new Tour();
            tour.setProductId(1);
        }
        if (page==null){
            page="1";
        }
        PageHelper.startPage(Integer.valueOf(page),5);
        List<Tour> tours1=tourService.queryByPid(tour);
        PageInfo<Tour> tourPageInfo = new PageInfo<>(tours1);
        model.addAttribute("page",Integer.valueOf(page));
        model.addAttribute("pages",tourPageInfo.getPages());
        model.addAttribute("tours",tours1);
        return "userShowTours";
    }

    @RequestMapping("/insertTour.do")
    public String insertTour(Tour tour,Model model){
        tour.setTourStatus("2");//默认状态为2-待成团，关闭预定
        if (tourService.insertTour(tour)){
            model.addAttribute("success","增加成功");
        }else {
            model.addAttribute("error","增加失败");
        }

        return "forward:showTour.do";
    }
    @RequestMapping("/tour.do")
    public String tour(Tour tour,Model model){
        Tour tour1=tourService.query(tour);
        model.addAttribute("tour",tour);
        return "showTours";
    }


    @RequestMapping("/removeTour.do")
    public String removeTour(Tour tour, Model model, HttpServletResponse response) throws IOException {

        if (tourService.removeTour(tour)){
            response.getWriter().write("删除成功");
        }else {
            response.getWriter().write("删除失败");
        }
        return "showTours";
    }

    @RequestMapping("/queryTransPort.do")
    @ResponseBody
    public String queryTransPort(Tour tour){
        List<Tour> tours=tourService.queryByPid(tour);
        List<Tour> tourList=Util.de_weightTrans(tours);
        return JSON.toJSONString(tours);
    }

    @RequestMapping("/updateTour.do")
    public String updateTour(Tour tour,Model model){
        Tour tour1=tourService.query(tour);
        model.addAttribute("tour",tour);
        return "showTours";
    }

    @RequestMapping("/openBooking.do")
    public String openBooking(Model model,String tourId){
        int res = tourService.openBooking(Integer.valueOf(tourId));
        Long pId = tourService.queryPIdByTourId(Integer.valueOf(tourId));
        model.addAttribute("productId",pId);
        if(res==1){
            model.addAttribute("success","开放预定成功");
        }
        else if(res==2){
            model.addAttribute("error","已开放预定，不可重复操作！");
        }
        else if(res==3){
            model.addAttribute("error","已发团，不可开放预定！");
        }
        else if(res==4){
            model.addAttribute("error","已取消，不可开放预定！");
        }
        else {
            model.addAttribute("error","操作失败");
        }
        return "forward:showTour.do";
    }

    @RequestMapping("/closeBooking.do")
    public String closeBooing(Model model,String tourId){
        int res = tourService.closeBooking(Integer.valueOf(tourId));
        Long pId = tourService.queryPIdByTourId(Integer.valueOf(tourId));
        model.addAttribute("productId",pId);
        if(res==1){
            model.addAttribute("success","关闭预定成功");
        }
        else if(res==2){
            model.addAttribute("error","已关闭预定，不可重复操作！");
        }
        else if(res==3){
            model.addAttribute("error","已发团，不可关闭预定！");
        }
        else if(res==4){
            model.addAttribute("error","已取消，不可关闭预定！");
        }
        else {
            model.addAttribute("error","操作失败");
        }

        return "forward:showTour.do";
    }

    @RequestMapping("/startTour.do")
    public String startTour(Model model,String tourId){
        int res = tourService.startTour(Integer.valueOf(tourId));
        Long pId = tourService.queryPIdByTourId(Integer.valueOf(tourId));
        model.addAttribute("productId",pId);
        if(res==1){
            model.addAttribute("success","发团成功");
        }
        else if(res==2){
            model.addAttribute("error","开放预定中，不可发团！请先关闭预定");
        }
        else if(res==3){
            model.addAttribute("error","未成团，不可发团！");
        }
        else if(res==4){
            model.addAttribute("error","已发团，不可重复操作！");
        }
        else if(res==5){
            model.addAttribute("error","已取消，不可发团！");
        }
        else {
            model.addAttribute("error","操作失败");
        }

        return "forward:showTour.do";
    }

    @RequestMapping("/cancelTour.do")
    public String cancelTour(Model model,String tourId){
        int res = tourService.cancelTour(Integer.valueOf(tourId));
        Long pId = tourService.queryPIdByTourId(Integer.valueOf(tourId));
        model.addAttribute("productId",pId);
        if(res==1){
            model.addAttribute("success","取消成功");
        }
        else if(res==2){
            model.addAttribute("choice","已有人预定，请确认是否要取消该团！");
        }
        else if(res==3){
            model.addAttribute("error","已成团，不可取消！");
        }
        else if(res==4){
            model.addAttribute("error","已取消，不可重复操作！");
        }
        else {
            model.addAttribute("error","操作失败");
        }

        return "forward:showTour.do";
    }

    @RequestMapping("/deleteTour.do")
    public String deleteTour(Model model,String tourId){
        Long pId = tourService.queryPIdByTourId(Integer.valueOf(tourId));
        model.addAttribute("productId",pId);
        Tour tour =new Tour();
        tour.setTourId(Long.valueOf(tourId));
        boolean flag = tourService.removeTour(tour);
        if(flag){
            model.addAttribute("success","删除成功");
        }
        else {
            model.addAttribute("error","删除失败，不可删除已有预定的旅行团！");
        }

        return "forward:showTour.do";
    }
    /*创建订单*/
    @RequestMapping("/createOne.do")
    public String createOne(Model model,Tour tour,Integer sRoom,Product product,Integer numberOfTrips){
//        sRoom:标准间
        /*出发地*/
        Area departureArea=new Area();
        departureArea.setAreaId(product.getDaId());
        departureArea=areaService.queryOne(departureArea);
        /*目的地*/
        Area destinationArea=new Area();
        destinationArea.setAreaId(product.getArrAreaId());
        destinationArea=areaService.queryOne(destinationArea);
        /*酒店*/
        Hotel hotel=new Hotel();
        hotel.setHotelId(product.getHotelId());
        hotel=hotelService.queryOne(hotel);

        tour=tourService.query(tour);
        if(tour==null){
            model.addAttribute("error","该天没有旅行团哦");
            return "productOne";
        }
        /*判断用户选择的出行工具*/
        if (tour.getTransType().equals("1")){
             /*火车*/
            Train train=new Train();
            Traindetail traindetail=new Traindetail();
            traindetail.setTdId(tour.getGoId());
            traindetail=transportationService.queryOne(traindetail);
            train.setTrId(traindetail.getTrId());
            train=transportationService.queryOne(train);
            model.addAttribute("traindetail",traindetail);
            model.addAttribute("train",train);
        }
        if (tour.getTransType().equals("2")){
            /*飞机*/
            Flight flight=new Flight();
            Flightdetail flightdetail=new Flightdetail();
            flightdetail.setFdId(tour.getGoId());
            flightdetail=transportationService.query(flightdetail).get(0);
            flight.setFlightId(flightdetail.getFlightId());
            flight=transportationService.queryOne(flight);
            model.addAttribute("flightdetail",flightdetail);
            model.addAttribute("flight",flight);
        }
        /*出行人数  Number of trips*/
        model.addAttribute("numberOfTrips",numberOfTrips);
        /*出发地*/
        model.addAttribute("departureArea",departureArea);
        /*目的地*/
        model.addAttribute("destinationArea",destinationArea);
        /*酒店*/
        model.addAttribute("hotel",hotel);
        /*房间数*/
        model.addAttribute("sRoom",sRoom);
        model.addAttribute("product",product);
        /*用户购票页面*/
        return "confirmOrderView";
    }
    /*添加评论*/
    @RequestMapping("/createComment.do")
    public String createComment(Userorder userorder, Comment comment,Model model){
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
        return "indexcopy";
    }
}
