package com.lvbaba.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.entity.Hotel;
import com.lvbaba.entity.Room;
import com.lvbaba.entity.Roomdetail;
import com.lvbaba.entity.Tour;
import com.lvbaba.service.HotelService;
import com.lvbaba.service.RoomDetailService;
import com.lvbaba.service.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

import javax.json.Json;
import javax.print.DocFlavor;

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
    public String showHotels(Model model,String page){
        if (page==null){
            page="1";
        }
        PageInfo<Hotel> hotelPageInfo = hotelService.queryAll(Integer.valueOf(page));
        model.addAttribute("page",Integer.valueOf(page));
        model.addAttribute("pages",hotelPageInfo.getPages());
        model.addAttribute("hotelList",hotelPageInfo.getList());
        return "showHotels";
    }

    @RequestMapping("hotelView.do")
    public String showHotels(Model model){
        return "searchHotel";
    }


    @RequestMapping("/showRooms.do")
    public String showRooms(Model model, String hotelId) {
        Room room = new Room();
        room.setHotelId(Long.valueOf(hotelId));
        List<Room> list = roomService.query(room);
        model.addAttribute("roomList", list);
        model.addAttribute("hotelId", hotelId);
        return "showRooms";
    }

    @RequestMapping("/showRoomDetail.do")
    public String showRoomDetail(Model model, String roomId) {
        Roomdetail roomdetail = new Roomdetail();
        roomdetail.setRoomId(Long.valueOf(roomId));
        List<Roomdetail> list = roomDetailService.query(roomdetail);
        model.addAttribute("roomDetail", list);
        model.addAttribute("roomId", roomId);
        return "showRoomDetail";
    }

    @RequestMapping("/addHotel.do")
    public String addHotel(Model model, String areaId, String hotelLevel, String hotelName) {
        Hotel hotel = new Hotel(Long.valueOf(areaId), hotelName, Long.valueOf(hotelLevel));
        boolean flag = hotelService.insertHotel(hotel);
        if (flag) {
            model.addAttribute("success", "添加成功");
        } else {
            model.addAttribute("error", "添加失败");
        }
        return "forward:showHotels.do";
    }

    @RequestMapping("/addRoom.do")
    public String addRoom(Model model, String hotelId, String number, String limit) {
        Room room = new Room(Long.valueOf(hotelId), Long.valueOf(number), Long.valueOf(limit));
        boolean flag = roomService.insertRoom(room);
        if (flag) {
            model.addAttribute("success", "添加成功");
        } else {
            model.addAttribute("error", "添加失败");
        }
        model.addAttribute("hotelId", hotelId);
        return "forward:showRooms.do";
    }

    @RequestMapping("/addRoomDetail.do")
    public String addRoomDetail(Model model, String roomId, String price, String date) {

        Roomdetail roomdetail = new Roomdetail(Long.valueOf(roomId), date, Double.valueOf(price));
        boolean flag = roomDetailService.insertRoomDetail(roomdetail);
        if (flag) {
            model.addAttribute("success", "添加成功");
        } else {
            model.addAttribute("error", "添加失败");
        }
        model.addAttribute("roomId", roomId);
        return "forward:showRoomDetail.do";
    }

    @RequestMapping("/updateHotel.do")
    public String updateHotel(Model model, String areaId, String hotelLevel, String hotelName, String hotelId) {
        Hotel hotel = new Hotel(Long.valueOf(hotelId), Long.valueOf(areaId), hotelName, Long.valueOf(hotelLevel));
        boolean flag = hotelService.updateHotel(hotel);
        if (flag) {
            model.addAttribute("success", "修改成功");
        } else {
            model.addAttribute("error", "修改失败");
        }
        return "forward:showHotels.do";

    }

    @RequestMapping("/showHotelInfo.do")
    @ResponseBody
    public String showHotelInfo(Hotel hotel){
        List<Hotel> hotels = hotelService.queryAllByAreaId(hotel);
        return JSON.toJSONString(hotels);
    }

    @RequestMapping("/updateRoom.do")
    public String updateRoom(Model model,String roomId,String number,String limit,String hotelId){
        Room room =new Room();
        room.setRoomId(Long.valueOf(roomId));
        room.setPersonLimit(Long.valueOf(limit));
        room.setRoomNumber(Long.valueOf(number));
        boolean flag = roomService.updateRoom(room);
        if (flag) {
            model.addAttribute("success", "修改成功");
        } else {
            model.addAttribute("error", "修改失败");
        }
        model.addAttribute("hotelId",hotelId);
        return "forward:showRooms.do";
    }

    @RequestMapping("/updateRoomDetail.do")
    public String updateRoomDetail(Model model,String rdId, String price, String date,String roomId){
        Roomdetail roomdetail =new Roomdetail();
        roomdetail.setRoomId(Long.valueOf(roomId));
        roomdetail.setRdId(Long.valueOf(rdId));
        roomdetail.setRoomDate(date);
        roomdetail.setRdPrice(Double.valueOf(price));
        boolean flag = roomDetailService.updateRoomDetail(roomdetail);
        if (flag) {
            model.addAttribute("success", "修改成功");
        } else {
            model.addAttribute("error", "修改失败");
        }
        model.addAttribute("roomId",roomId);
        return "forward:showRoomDetail.do";
    }

    @RequestMapping("/deleteHotel.do")
    public String deleteHotel(Model model,String hotelId){
        Hotel hotel =new Hotel();
        hotel.setHotelId(Long.valueOf(hotelId));
        boolean flag = hotelService.deleteHotel(hotel);
        if (flag) {
            model.addAttribute("success", "删除成功");
        } else {
            model.addAttribute("error", "删除失败");
        }
        return "forward:showHotels.do";
    }

    @RequestMapping("/deleteRoom.do")
    public String deleteRoom(Model model,String roomId,String hotelId){
        Room room =new Room();
        room.setRoomId(Long.valueOf(roomId));
        boolean flag = roomService.deleteRoom(room);
        if (flag) {
            model.addAttribute("success", "删除成功");
        } else {
            model.addAttribute("error", "删除失败");
        }
        model.addAttribute("hotelId",hotelId);
        return "forward:showRooms.do";
    }


    @RequestMapping("/deleteRoomDetail.do")
    public String deleteRoomDetail(Model model,String roomId,String rdId){
        Roomdetail roomdetail = new Roomdetail();
        roomdetail.setRdId(Long.valueOf(rdId));
        boolean flag = roomDetailService.deleteRoomDetail(roomdetail);
        if (flag) {
            model.addAttribute("success", "删除成功");
        } else {
            model.addAttribute("error", "删除失败");
        }
        model.addAttribute("roomId",roomId);
        return "forward:showRoomDetail.do";
    }


    @RequestMapping("/showHotelsResult.do")
    public String showHotels(Model model,String city,String inDate,String outDate,String number){
        List<Hotel> hotelList =hotelService.queryBySearch(city,inDate,outDate,Integer.valueOf(number));
        model.addAttribute("hotelList",hotelList);
        return "userHotelResult";

    }




}
