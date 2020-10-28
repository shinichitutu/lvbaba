package com.lvbaba.controller;

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

    @RequestMapping("/showRooms.do")
    public String showRooms(Model model, int hId) {
        Room room = new Room();
        room.sethId(hId);
        List<Room> list = roomService.query(room);
        model.addAttribute("roomList", list);
        model.addAttribute("hId", hId);
        return "showRooms";
    }

    @RequestMapping("/showRoomDetail.do")
    public String showRoomDetail(Model model, int rId) {
/*        System.out.println(rId);*/
        Roomdetail roomdetail = new Roomdetail();
        roomdetail.setrId(rId);
        List<Roomdetail> list = roomDetailService.query(roomdetail);
        model.addAttribute("roomDetail", list);
        model.addAttribute("rId", rId);
        return "showRoomDetail";
    }

    @RequestMapping("/addHotel.do")
    public String addHotel(Model model, String areaId, String hLevel, String hName) {
        Hotel hotel = new Hotel(Long.valueOf(areaId), hName, Long.valueOf(hLevel));
        boolean flag = hotelService.insertHotel(hotel);
        if (flag) {
            model.addAttribute("success", "添加成功");
        } else {
            model.addAttribute("error", "添加失败");
        }
        return "forward:showHotels.do";
    }

    @RequestMapping("/addRoom.do")
    public String addRoom(Model model, String hId, String number, String limit) {
        Room room = new Room(Long.valueOf(hId), Long.valueOf(number), Long.valueOf(limit));
        boolean flag = roomService.insertRoom(room);
        if (flag) {
            model.addAttribute("success", "添加成功");
        } else {
            model.addAttribute("error", "添加失败");
        }
        model.addAttribute("hId", hId);
        return "forward:showRooms.do";
    }

    @RequestMapping("/addRoomDetail.do")
    public String addRoomDetail(Model model, String rId, String price, String date) {

        Roomdetail roomdetail = new Roomdetail(Long.valueOf(rId), date, Double.valueOf(price));
        boolean flag = roomDetailService.insertRoomDetail(roomdetail);
        if (flag) {
            model.addAttribute("success", "添加成功");
        } else {
            model.addAttribute("error", "添加失败");
        }
        model.addAttribute("rId", rId);
        return "forward:showRoomDetail.do";
    }

    @RequestMapping("/updateHotel.do")
    public String updateHotel(Model model, String areaId, String hLevel, String hName, String hId) {
        Hotel hotel = new Hotel(Long.valueOf(hId), Long.valueOf(areaId), hName, Long.valueOf(hLevel));
        boolean flag = hotelService.updateHotel(hotel);
        if (flag) {
            model.addAttribute("success", "修改成功");
        } else {
            model.addAttribute("error", "修改失败");
        }
        return "forward:showHotels.do";

    }

    @RequestMapping("/updateRoom.do")
    public String updateRoom(Model model,String rId,String number,String limit){
        Room room =new Room();
        room.setrId(Long.valueOf(rId));
        room.setpLimit(Long.valueOf(limit));
        room.setrNumber(Long.valueOf(number));
        boolean flag = roomService.updateRoom(room);
        if (flag) {
            model.addAttribute("success", "修改成功");
        } else {
            model.addAttribute("error", "修改失败");
        }
        return "forward:showRooms.do";
    }

    @RequestMapping("/deleteHotel.do")
    public String deleteHotel(Model model,String hId){
        Hotel hotel =new Hotel();
        hotel.sethId(Long.valueOf(hId));
        boolean flag = hotelService.deleteHotel(hotel);
        if (flag) {
            model.addAttribute("success", "删除成功");
        } else {
            model.addAttribute("error", "删除失败");
        }
        return "forward:showHotels.do";
    }

    @RequestMapping("/deleteRoom.do")
    public String deleteRoom(Model model,String rId){
        Room room =new Room();
        room.setrId(Long.valueOf(rId));
        boolean flag = roomService.deleteRoom(room);
        if (flag) {
            model.addAttribute("success", "删除成功");
        } else {
            model.addAttribute("error", "删除失败");
        }
        return "forward:showRooms.do";
    }

}
