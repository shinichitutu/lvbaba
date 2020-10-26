package com.lvbaba.controller;

import com.alibaba.fastjson.JSONObject;
import com.lvbaba.entity.Area;
import com.lvbaba.service.AreaService;
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

    @RequestMapping("/showCountry.do")
    public ModelAndView showCountry(HttpSession session){
        List<Area> countryList = areaService.queryCountry();
        return new ModelAndView("addTransportView").addObject("countryList",countryList);
    }

    @RequestMapping("/showCity.do")
    @ResponseBody
    public void showCity(String country, HttpServletResponse response) throws IOException {
        Area area = new Area();
        area.setCountry(country);
        List<Area> cityList = areaService.queryCityByCountry(area);
        System.out.println("1111111111111111");
        response.getWriter().write(JSONObject.toJSONString(cityList));
    }
}
