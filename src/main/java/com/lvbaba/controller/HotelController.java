package com.lvbaba.controller;

import com.lvbaba.entity.Hotel;
import com.lvbaba.service.HotelService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by shinichi on 2020/10/23.
 */

@Controller
public class HotelController {
    @Resource
    private HotelService hotelService;

    @RequestMapping("/showHotels.do")
    public String showHotels(Model model){
        Hotel hotel = new Hotel();
        List<Hotel> hotelList = hotelService.query(hotel);
        for (Hotel h:hotelList) {
            System.out.println(h);
        }
        model.addAttribute("hotelList",hotelList);
        return "showHotels";
    }
}
