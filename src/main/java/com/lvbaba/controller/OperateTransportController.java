package com.lvbaba.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lvbaba.entity.Area;
import com.lvbaba.entity.Flight;
import com.lvbaba.entity.Train;
import com.lvbaba.service.AreaService;
import com.lvbaba.service.TransportationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String showCountry() {
        return "addTransportView";
    }

    @RequestMapping("/showCountry2.do")
    @ResponseBody
    public String showCountry2() {
        List<Area> countryList = areaService.queryCountry();
        return JSONObject.toJSONString(countryList);
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

    @RequestMapping("/updateFlight.do")
    @ResponseBody
    public String updateFlight(Flight flight){
        boolean flag = transportationService.updateFlight(flight);
        return ""+flag;
    }

    @RequestMapping("/updateTrain.do")
    @ResponseBody
    public String updateTrain(Train train){
        boolean flag = transportationService.updateTrainById(train);
        return ""+flag;
    }

    @RequestMapping("/showTrainInfo.do")
    public String showTrainInfo(Model model){
        List<Flight> flightList = transportationService.queryAllFlight();
        List<Train> trainList = transportationService.queryAllTrain();
        model.addAttribute("flightList",flightList);
        model.addAttribute("trainList",trainList);
        return "forward:/WEB-INF/jsp/showTransportView.jsp?#trainInfo";
    }
}
