package com.lvbaba.controller;

import com.alibaba.fastjson.JSON;
import com.lvbaba.entity.Area;
import com.lvbaba.service.AreaService;
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
 * @date 2020/10/26 16:34
 */
@Controller
public class AreaController {
    @Resource
    private AreaService areaService;

    @RequestMapping("/showCountry.do")
    @ResponseBody
    public String showCountry(){
        List<Area> countryList = areaService.queryCountry();
        return JSON.toJSONString(countryList);
    }

    @RequestMapping("/showCity.do")
    @ResponseBody
    public String showCity(String country, HttpServletResponse response) throws IOException {
        Area area = new Area();
        area.setCountry(country);
        List<Area> cityList = areaService.queryCityByCountry(area);
        cityList.forEach(System.out::println);
        return JSON.toJSONString(cityList);
    }
}
