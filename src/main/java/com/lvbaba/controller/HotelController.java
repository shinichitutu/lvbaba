package com.lvbaba.controller;

import com.lvbaba.entity.Hotel;
import com.lvbaba.entity.Room;
import com.lvbaba.entity.Roomdetail;
import com.lvbaba.service.HotelService;
import com.lvbaba.service.RoomDetailService;
import com.lvbaba.service.RoomService;
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

    @Resource
    private RoomService roomService;

    @Resource
    private RoomDetailService roomDetailService;

    @RequestMapping("/showHotels.do")
    public String showHotels(Model model){
        Hotel hotel = new Hotel();
        List<Hotel> hotelList = hotelService.query(hotel);
/*        for (Hotel h:hotelList) {
            System.out.println(h);
        }*/
        model.addAttribute("hotelList",hotelList);
        return "showHotels";
    }

    @RequestMapping("/showRoms.do")
    public String showRooms(Model model){
        Room room = new Room();
        List<Room> list =roomService.query(room);
        model.addAttribute("roomList",list);
        return "showRooms";
    }

    @RequestMapping("/showRoomDetail.do")
    public String showRoomDetail(Model model){
        Roomdetail roomdetail = new Roomdetail();
        List<Roomdetail> list = roomDetailService.query(roomdetail);
        model.addAttribute("roomDetail",list);
        return "showRoomDetail";
    }

}
