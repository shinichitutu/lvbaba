package com.lvbaba.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.entity.*;
import com.lvbaba.service.AreaService;
import com.lvbaba.service.TicketrecordService;
import com.lvbaba.service.TransportationService;
import com.lvbaba.service.UserService;
import com.lvbaba.utli.UserbLocker;
import com.lvbaba.utli.Util;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
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
    @Resource
    private UserService userService;
    @Resource
    private TicketrecordService ticketrecordService;

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
        boolean flag = transportationService.insertFlightDatail(flightdetail);
        return "" + flag;
    }

    @RequestMapping("/addTrainDetail.do")
    @ResponseBody
    public String addTrainDetail(Traindetail traindetail, Model model) {
        boolean flag = transportationService.insertTraindetail(traindetail);
        model.addAttribute("addTDInfo", flag);
        return "" + flag;
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

    public String searchFlight(String date, String daId, String arrAreaId) {
        Flight flight = new Flight();

        flight.setDaId(Long.valueOf(daId));
        flight.setArrAreaId(Long.valueOf(arrAreaId));
        List<Flight> flightList = transportationService.query(flight);
        Flightdetail flightdetail = new Flightdetail();
        flightdetail.setFdDate(date);
        List<Flightdetail> flightdetailList = transportationService.query(flightdetail);
        List<Flightdetail> flightdetailList1 = new ArrayList<>();
        for (Flight f : flightList) {
            for (Flightdetail fd : flightdetailList) {
                if (f.getFlightId() == fd.getFlightId()) {
                    flightdetailList1.add(fd);
                }
            }
        }
        return JSON.toJSONString(flightdetailList1);
    }

    @RequestMapping("/searchTrain.do")
    @ResponseBody
    public String searchTrain(String date, String daId, String arrAreaId) {
        Train train = new Train();
        train.setdaId(Long.valueOf(daId));
        train.setarrAreaId(Long.valueOf(arrAreaId));
        List<Train> trainList = transportationService.query(train);
        Traindetail traindetail = new Traindetail();
        traindetail.setTdDate(date);
        List<Traindetail> traindetailList = transportationService.query(traindetail);
        List<Traindetail> traindetailList1 = new ArrayList<>();
        for (Train t : trainList) {
            for (Traindetail td : traindetailList) {
                if (t.getTrId() == td.getTrId()) {
                    traindetailList1.add(td);
                }
            }
        }

        return JSON.toJSONString(traindetailList1);

    }

    @RequestMapping("/toUserFlightBookView.do")
    public String toUserFlightBookView() {
        return "userFlightBookView";
    }

    @RequestMapping("/searchFlightInfo.do")
    public String searchFlightAndDetail(Long d_city, Long a_city ,String date, Model model) {
        String time = Util.getDate().replace("-",":");
        Flight flight = new Flight();
        flight.setDaId(d_city);
        flight.setArrAreaId(a_city);
        flight.setFlightDTime(time);
        List<Flightdetail> flightdetailList = transportationService.queryFlightInfoByAreaIdAndDate(flight, date);
        model.addAttribute("flightDetailInfoList",flightdetailList);
        return "forward:toUserFlightBookView.do";
    }
    @GetMapping(value = "toTicketOrderView",produces = MediaType.APPLICATION_ATOM_XML_VALUE)
    @UserbLocker
    @RequestMapping("/toTicketOrderView.do")
    public String toTicketOrderView(Ticketrecord ticketrecord,Model model,HttpSession session){
        System.out.println("----------------"+ticketrecord);
        User user = (User) session.getAttribute("user");
        Userinfo userinfo = new Userinfo();
        userinfo.setuId(user.getuId());
//        userinfo.setuId(1);
        List<Userinfo> userinfos = userService.queryAllByUid(userinfo);
        session.setAttribute("ticketrecord",ticketrecord);
        model.addAttribute("userinfos",userinfos);
        return "ticketOrderView";
    }

    @RequestMapping("/payFlightTicket.do")
    public String payFlightTicket(Ticketrecord ticketrecord,String userIds,HttpSession session,Model model){
        User user = (User) session.getAttribute("user");
        System.out.println("支付时"+ticketrecord+"-----------"+userIds);
        boolean flag=false;
        if (userIds!=null && userIds!="") {
            String[] array = userIds.split(",");
            for (int i = 0; i < array.length; i++) {
                Userinfo userinfo = userService.queryUserInfoByUiId(Long.parseLong(array[i]));
                ticketrecord.setUserId(user.getuId());
                ticketrecord.setUserName(userinfo.getPerson());
                ticketrecord.setUserIdcard(userinfo.getIdcard());
                ticketrecord.setUserPhone(userinfo.getPerson());
                ticketrecord.setCreateDate(Util.getCurrentDate());
                flag = ticketrecordService.insertTicketRecord(ticketrecord);
            }
        }
        if (flag){
            model.addAttribute("insertTicketRecord","支付完成，等待出票");
            return "forward:toBookingRecordView.do";
        }else{
            model.addAttribute("insertTicketRecord","支付失败！！");
            return "forward:toTicketOrderView.do";
        }
    }
//    @GetMapping(value="toBookingRecordView", produces = MediaType.APPLICATION_ATOM_XML_VALUE)
    @UserbLocker
    @RequestMapping("/toBookingRecordView.do")
    public String toBookingRecordView(HttpSession session,Model model){
        User user = (User) session.getAttribute("user");
        List<Ticketrecord> ticketrecords = ticketrecordService.queryAllByUerId(user.getuId());
        model.addAttribute("ticketrecords",ticketrecords);
        return "bookingRecordView";
    }

    @RequestMapping("/returnTicket.do")
    public String returnTicket(String fdrId,Model model){
        Ticketrecord ticketrecord = new Ticketrecord();
        ticketrecord.setFdrId(Long.parseLong(fdrId));
        ticketrecord.setModifyDate(Util.getCurrentDate());
        ticketrecord.setRecordStatus("已退票");
        boolean flag = ticketrecordService.updateTicketRecordByFdrId(ticketrecord);
        if (flag) {
            model.addAttribute("returnTicketInfo","退票成功");
        }else{
            model.addAttribute("returnTicketInfo","退票失败");
        }
        return "forward:toBookingRecordView.do";
    }
}
