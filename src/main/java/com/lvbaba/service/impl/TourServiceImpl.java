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
        return tourDao.removeTour(tour);
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
}
