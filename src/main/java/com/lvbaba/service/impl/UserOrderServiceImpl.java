package com.lvbaba.service.impl;

import com.lvbaba.dao.*;
import com.lvbaba.entity.*;
import com.lvbaba.service.ProductService;
import com.lvbaba.service.UserOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YY on 2020/11/4.
 */
@Service("userOrderService")
public class UserOrderServiceImpl implements UserOrderService{
    @Resource
    private UserorderDao userorderDao;
    @Resource
    private TourDao tourDao;
    @Resource
    private ProductDao productDao;
    @Resource
    private AreaDao areaDao;
    @Resource
    private HotelDao hotelDao;
    @Resource
    private FilesDao filesDao;
    @Resource
    private FlightDao flightDao;
    @Resource
    private FlightDatailDao flightDatailDao;
    @Resource
    private TrainDao trainDao;
    @Resource
    private TraindetailDao traindetailDao;
    @Resource
    private RoomDetailDao roomDetailDao;
    @Resource
    private TicketrecordDao ticketrecordDao;

    @Override
    public Userorder queryOne(Userorder userorder) {
        return userorderDao.queryOne(userorder);
    }

    @Override
    public List<Userorder> query(Userorder userorder) {
        if (null==userorder){
            return null;
        }
        return userorderDao.query(userorder);
    }

    @Override
    public List<Userorder> queryAll() {
        return userorderDao.queryAll();
    }

    @Override
    public boolean insertUserorder(Userorder userorder) {
        return userorderDao.insertUserorder(userorder);
    }

    @Override
    public boolean deleteUserorder(Userorder userorder) {
        return userorderDao.deleteUserorder(userorder);
    }

    @Override
    public boolean updateUserorder(Userorder userorder) {
        return userorderDao.updateUserorder(userorder);
    }

    @Override
    public List<Userorder> queryUserOrdersByUserId(Long userId) {
        List<Userorder> userorderList = userorderDao.queryUserOrdersByUserId(userId);
        if (userorderList!=null && userorderList.size()>0){
            for (Userorder uo:userorderList) {
                Tour tour=  new Tour();
                tour.setTourId(uo.getTourId());
                Tour tour1 = tourDao.query(tour);
                if ("1".equals(tour1.getTransType())){
                    Flightdetail flightdetail = flightDatailDao.queryByFdId(tour1.getGoId());
                    tour1.setFlightdetail(flightdetail);
                    tour1.setGo_flight(flightDao.queryOne(new Flight(flightdetail.getFlightId())));
                    flightdetail = flightDatailDao.queryByFdId(tour1.getReturnId());
                    tour1.setRe_flight(flightDao.queryOne(new Flight(flightdetail.getFlightId())));
                }else if("2".equals(tour1.getTransType())){
                    Traindetail traindetail = traindetailDao.queryOne(new Traindetail(tour1.getGoId()));
                    tour1.setTraindetail(traindetail);
                    tour1.setGo_train(trainDao.queryOne(new Train(traindetail.getTrId())));
                    traindetail = traindetailDao.queryOne(new Traindetail(tour1.getReturnId()));
                    tour1.setRe_train(trainDao.queryOne(new Train(traindetail.getTrId())));
                }
                uo.setTour(tour1);
                Product product = productDao.query(new Product(tour1.getProductId()));
                product.setD_area(areaDao.queryOne(new Area(product.getDaId())));
                product.setA_area(areaDao.queryOne(new Area(product.getArrAreaId())));
                product.setHotel(hotelDao.queryOne(new Hotel(product.getHotelId())));
                product.setFiles(filesDao.queryByProductId(product.getProductId()));
                uo.setProduct(product);
            }
        }
        return userorderList;
    }

    @Override
    public boolean returnOrder(Long orderId) {
        Userorder userorder = userorderDao.queryOne(new Userorder(orderId));
        boolean flag1 = tourDao.updateBookNum(new Tour(userorder.getTourId(),-userorder.getRoomNum()));
        boolean flag2 = roomDetailDao.updateRoomDetailRdNumber(new Roomdetail(userorder.getRoomId(), -userorder.getRoomNum()));
        Userorder userorder1 = new Userorder();
        userorder1.setOrderId(orderId);
        userorder1.setOrderStatus("已退团");
        boolean flag5 = userorderDao.updateUserorder(userorder1);
        Tour tour = tourDao.query(new Tour(userorder.getTourId()));
        boolean flag3 =false;
        boolean flag4 =false;
        boolean flag6 =false;
        boolean flag7 =false;
        if ("1".equals(tour.getTransType())) {
            flag3 = flightDatailDao.updateFlightDetailTickets(tour.getGoId(), userorder.getRoomNum());
            flag6 = flightDatailDao.updateFlightDetailTickets(tour.getReturnId(), userorder.getRoomNum());
        }else if("2".equals(tour.getTransType())) {
            flag4 = traindetailDao.updateTraindetailTickets(new Traindetail(tour.getGoId(), userorder.getRoomNum()));
            flag7 = traindetailDao.updateTraindetailTickets(new Traindetail(tour.getReturnId(), userorder.getRoomNum()));
        }
        return flag1&&flag2&&flag5&&((flag3 && flag6)||(flag7&&flag4))?true:false;
    }
}
