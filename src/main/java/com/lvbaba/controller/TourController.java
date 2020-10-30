package com.lvbaba.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.entity.Product;
import com.lvbaba.entity.Tour;
import com.lvbaba.service.ProductService;
import com.lvbaba.service.TourService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
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
    private ProductService productService;

    @RequestMapping("/showTour.do")
    public String showTour(Model model,Tour tour,String page){
        if (tour==null){
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
        Product product = productService.query(new Product(tour.getProductId()));
        model.addAttribute("product",product);
        return "showTours";
    }

    @RequestMapping("/userShowTour.do")
    public String userShowTour(Model model,Tour tour,String page){
        if (tour==null){
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
        System.out.println(tour);
        if (tourService.removeTour(tour)){
            response.getWriter().write("删除成功");
        }else {
            response.getWriter().write("删除失败");
        }
        return "showTours";
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


}
