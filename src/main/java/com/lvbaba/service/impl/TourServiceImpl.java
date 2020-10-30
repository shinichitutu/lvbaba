package com.lvbaba.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.dao.TourDao;
import com.lvbaba.entity.Tour;
import com.lvbaba.service.TourService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YY on 2020/10/20.
 */
@Service("tourService")
public class TourServiceImpl implements TourService {
    @Resource
    private TourDao tourDao;

    @Override
    public boolean insertTour(Tour tour) {
        return tourDao.insertTour(tour);
    }

    @Override
    public boolean updateTour(Tour tour) {
        return tourDao.updateTour(tour);
    }

    @Override
    public boolean removeTour(Tour tour) {
        Tour tour1 =tourDao.query(tour);
        if(tour1.getBookNum()==0){
            return tourDao.removeTour(tour);
        }
        else {
            return false;
        }

    }

    @Override
    public Tour query(Tour tour) {
        return tourDao.query(tour);
    }

    @Override
    public List<Tour> queryAll() {
        return tourDao.queryAll();
    }

    @Override
    public List<Tour> queryByPid(Tour tour) {
        return tourDao.queryByPid(tour);
    }


/*    1-待成团，开放预定
    2-待成团，关闭预定
    3-已成团，开放预定
    4-已成团，关闭预定
    5-已发团
    6-已取消*/
    @Override
    public int openBooking(int tourId) {
        Tour tour = new Tour();
        tour.setTourId(tourId);
        Tour tour1 = query(tour);
        int status = Integer.valueOf(tour1.getTourStatus());
        if (status == 2) {
            tour1.setTourStatus("1");
            tourDao.updateTour(tour1);
            return 1;
        }
        if (status == 4) {
            tour1.setTourStatus("3");
            tourDao.updateTour(tour1);
            return 1;
        }
        if (status == 1 || status == 3) {
            return 2;
        }

        if (status == 5) {
            return 3;
        }

        if (status == 6) {
            return 4;
        }
        return 0;
    }

    @Override
    public int closeBooking(int tourId) {
        Tour tour = new Tour();
        tour.setTourId(tourId);
        Tour tour1 = query(tour);
        int status = Integer.valueOf(tour1.getTourStatus());
        if (status == 1) {
            tour1.setTourStatus("2");
            tourDao.updateTour(tour1);
            return 1;
        }
        if (status == 3) {
            tour1.setTourStatus("4");
            tourDao.updateTour(tour1);
            return 1;
        }
        if (status == 2 || status == 4) {
            return 2;
        }

        if (status == 5) {
            return 3;
        }

        if (status == 6) {
            return 4;
        }
        return 0;
    }

    @Override
    public int startTour(int tourId) {
        Tour tour = new Tour();
        tour.setTourId(tourId);
        Tour tour1 = query(tour);
        int status = Integer.valueOf(tour1.getTourStatus());

        if (status == 4) {
            tour1.setTourStatus("5");
            tourDao.updateTour(tour1);
            return 1;
        }

        if (status == 3) {
            return 2;
        }

        if (status == 1 || status == 2) {
            return 3;
        }

        if (status == 5) {
            return 4;
        }

        if (status == 6) {
            return 5;
        }
        return 0;
    }

    @Override
    public int cancelTour(int tourId) {
        Tour tour = new Tour();
        tour.setTourId(tourId);
        Tour tour1 = query(tour);
        Long bookingNum = tour1.getBookNum();
        int status = Integer.valueOf(tour1.getTourStatus());
        if (status == 1||status==2) {
            if(bookingNum==0){
                tour1.setTourStatus("6");
                tourDao.updateTour(tour1);
                return 1;
            }
            else {
                return 2;
            }
        }
        if (status == 3 || status == 4 ||status==5) {
            return 3;
        }

        if (status == 6) {
            return 4;
        }

        return 0;
    }

/*    待完善，要进行退款*/
    @Override
    public boolean forceCancelTour(int tourId) {
        Tour tour = new Tour();
        tour.setTourId(tourId);
        Tour tour1 = query(tour);
        tour1.setTourStatus("6");
        return tourDao.updateTour(tour1);
    }

}
