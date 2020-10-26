package com.lvbaba.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lvbaba.entity.Area;
import com.lvbaba.entity.Flight;
import com.lvbaba.service.AreaService;
import com.lvbaba.service.TransportationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.json.JsonArray;
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

    @RequestMapping("/showCountry.do")
    public ModelAndView showCountry(HttpSession session){
        List<Area> countryList = areaService.queryCountry();
        return new ModelAndView("addTransportView").addObject("countryList",countryList);
    }

    @RequestMapping("/showCity.do")
    @ResponseBody
    public String showCity(String country, HttpServletResponse response) throws IOException {
        Area area = new Area();
        area.setCountry(country);
        List<Area> cityList = areaService.queryCityByCountry(area);
        return JSON.toJSONString(cityList);
    }

    @RequestMapping("/addFlight.do")
    @ResponseBody
    public String addFlight(Flight flight){
        boolean flag = transportationService.insertFlight(flight);
        return ""+flag;
    }
}
