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

    @RequestMapping("/showRooms.do")
    public String showRooms(Model model,int hId){
        Room room = new Room();
        room.sethId(hId);
        List<Room> list =roomService.query(room);
        model.addAttribute("roomList",list);
        return "showRooms";
    }

    @RequestMapping("/showRoomDetail.do")
    public String showRoomDetail(Model model,int rId){
/*        System.out.println(rId);*/
        Roomdetail roomdetail = new Roomdetail();
        roomdetail.setrId(rId);
        List<Roomdetail> list = roomDetailService.query(roomdetail);
        model.addAttribute("roomDetail",list);
        return "showRoomDetail";
    }

    @RequestMapping("/addHotel.do")
    public String addHotel(Model model,String areaId,String hLevel,String hName){
        System.out.println(areaId);
        System.out.println(hLevel);
        System.out.println(hName);
        Hotel hotel =new Hotel(Long.valueOf(areaId),hName,Long.valueOf(hLevel));
        hotelService.insertHotel(hotel);
        model.addAttribute("success","添加成功");
        return "forward:showHotels.do";
    }

}
