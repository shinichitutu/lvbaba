package com.lvbaba.controller;

import com.lvbaba.entity.Tour;
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

    @RequestMapping("/showTour.do")
    public String showTour(Model model,Tour tour){
        if (tour==null){
            tour.setpId(1);
        }
        List<Tour> tours1=tourService.queryByPid(tour);
        model.addAttribute("tours",tours1);
        return "showTours";
    }
    @RequestMapping("/insertTour.do")
    public String insertTour(Tour tour,Model model){
        if (tourService.insertTour(tour)){
            model.addAttribute("success","增加成功");
        }else {
            model.addAttribute("error","增加失败");
        }
        return "showTours";
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
}
