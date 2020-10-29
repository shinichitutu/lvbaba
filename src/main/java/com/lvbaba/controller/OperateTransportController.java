package com.lvbaba.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lvbaba.entity.*;
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
    public String addFlight(Flight flight) {
        boolean flag = transportationService.insertFlight(flight);
        return "" + flag;
    }

    @RequestMapping("/addTrain.do")
    @ResponseBody
    public String addTrain(Train train) {
        boolean flag = transportationService.insertTrain(train);
        return "" + flag;
    }

    @RequestMapping("/showFlightAndTrain.do")
    public ModelAndView showFlightAndTrain() {
        List<Flight> flightList = transportationService.queryAllFlight();
        List<Train> trainList = transportationService.queryAllTrain();
        ModelAndView mv = new ModelAndView("showTransportView");
        mv.addObject("flightList", flightList);
        mv.addObject("trainList", trainList);
        return mv;
    }

    @RequestMapping("/updateFlight.do")
    @ResponseBody
    public String updateFlight(Flight flight) {
        boolean flag = transportationService.updateFlight(flight);
        return "" + flag;
    }

    @RequestMapping("/updateTrain.do")
    @ResponseBody
    public String updateTrain(Train train) {
        boolean flag = transportationService.updateTrainById(train);
        return "" + flag;
    }

    @RequestMapping("/showTrainInfo.do")
    public String showTrainInfo(Model model) {
        List<Flight> flightList = transportationService.queryAllFlight();
        List<Train> trainList = transportationService.queryAllTrain();
        model.addAttribute("flightList", flightList);
        model.addAttribute("trainList", trainList);
        return "forward:/WEB-INF/jsp/showTransportView.jsp?#trainInfo";
    }

    @RequestMapping("/addFlightDetail.do")
    @ResponseBody
    public String addFlightDetail(Flightdetail flightdetail, Model model) {
        System.out.println(flightdetail);
        boolean flag = transportationService.insertFlightDatail(flightdetail);
        return ""+flag;
    }

    @RequestMapping("/addTrainDetail.do")
    @ResponseBody
    public String addTrainDetail(Traindetail traindetail, Model model) {
        System.out.println(traindetail);
        boolean flag = transportationService.insertTraindetail(traindetail);
        model.addAttribute("addTDInfo", flag);
        return ""+flag;
    }

    @RequestMapping("/deleteFlight.do")
    public String deleteFlight(String flightId, Model model) {
        Flight flight = new Flight();
        flight.setFlightId(Long.parseLong(flightId));
        boolean flag = transportationService.deleteFlight(flight);
        if (flag) {
            model.addAttribute("delFlightInfo", "删除成功");
        } else {
            model.addAttribute("delFlightInfo", "删除失败");
        }
        return "forward:showFlightAndTrain.do";
    }

    @RequestMapping("/showFlightDetailView.do")
    public ModelAndView showFlightDetailView(String flightId) {
        Flight flight = new Flight();
        flight.setFlightId(Long.parseLong(flightId));
        List<Flight> flightList = transportationService.queryFlightAndDatailBydaIdAndarrAreaId(flight);
        ModelAndView mv = new ModelAndView("showFlightDetail");
        mv.addObject("flightDetailList", flightList);
        return mv;
    }

    @RequestMapping("/deleteTrain.do")
    public String deleteTrain(String trId, Model model) {
        Train train = new Train();
        train.setTrId(Long.parseLong(trId));
        boolean flag = transportationService.deleteTrainById(train);
        if (flag) {
            model.addAttribute("delTrainInfo", "删除成功");
        } else {
            model.addAttribute("delTrainInfo", "删除失败");
        }
        return "forward:/WEB-INF/jsp/showTransportView.jsp?#trainInfo";
    }

    @RequestMapping("/showTrainDetailView.do")
    public ModelAndView showTrainDetailView(String trId) {
        Train train = new Train();
        train.setTrId(Long.parseLong(trId));
        List<Train> trainList = transportationService.queryTrainAndDatailBydaIdAndarrAreaId(train);
        ModelAndView mv = new ModelAndView("showTrainDetail");
        mv.addObject("trainDetailList", trainList);
        return mv;
    }


    @RequestMapping("/searchFlight.do")
    @ResponseBody
    public String searchFlight(String deDate){
        Flightdetail flightdetail =new Flightdetail();
        flightdetail.setFdDate(deDate);
        List<Flightdetail> flightdetailList = transportationService.query(flightdetail);
        return JSON.toJSONString(flightdetailList);
    }

}
