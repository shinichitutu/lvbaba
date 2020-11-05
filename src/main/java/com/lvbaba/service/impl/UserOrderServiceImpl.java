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
                    tour1.setFlight(flightDao.queryOne(new Flight(flightdetail.getFlightId())));
                }else if("2".equals(tour1.getTransType())){
                    Traindetail traindetail = traindetailDao.queryOne(new Traindetail(tour1.getGoId()));
                    tour1.setTraindetail(traindetail);
                    tour1.setTrain(trainDao.queryOne(new Train(traindetail.getTrId())));
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
}
