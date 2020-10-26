package com.lvbaba.controller;

import com.alibaba.fastjson.JSON;
import com.lvbaba.entity.Area;
import com.lvbaba.entity.Flight;
import com.lvbaba.entity.Train;
import com.lvbaba.service.AreaService;
import com.lvbaba.service.TransportationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author DBY
 * @date 2020/10/23 14:17
 */

@Controller
public class OperateTransportController {
    @Resource
    private AreaService areaService;
    @Resource
    private TransportationService transportationService;

    @RequestMapping("/addTransportView.do")
    public String showCountry(){
        return "addTransportView";
    }

    @RequestMapping("/addFlight.do")
    @ResponseBody
    public String addFlight(Flight flight){
        boolean flag = transportationService.insertFlight(flight);
        return ""+flag;
    }

    @RequestMapping("/addTrain.do")
    @ResponseBody
    public String addTrain(Train train){
        boolean flag = transportationService.insertTrain(train);
        return ""+flag;
    }

    @RequestMapping("/showFlightAndTrain.do")
    public ModelAndView showFlightAndTrain(){
        List<Flight> flightList = transportationService.queryAllFlight();
        List<Train> trainList = transportationService.queryAllTrain();
        ModelAndView mv = new ModelAndView("showTransportView");
        mv.addObject("flightList",flightList);
        mv.addObject("trainList",trainList);
        return mv;
    }
}
