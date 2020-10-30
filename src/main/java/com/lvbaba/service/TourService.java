package com.lvbaba.service;

import com.lvbaba.entity.Tour;

import java.util.List;

/**
 * Created by YY on 2020/10/20.
 */
public interface TourService {
    /**
     * 插入旅行团
     *
     * @param tour
     * @return
     */
    boolean insertTour(Tour tour);

    /**
     * 修改旅行团
     *
     * @param tour
     * @return
     */
    boolean updateTour(Tour tour);

    /**
     * 删除旅行团
     *
     * @param tour
     * @return
     */
    boolean removeTour(Tour tour);

    /**
     * 查询单个旅行团
     *
     * @param tour
     * @return
     */
    Tour query(Tour tour);

    /**
     * 查询所有旅行团
     *
     * @return
     */
    List<Tour> queryAll();

    /**
     * 根据产品查询旅行团
     *
     * @param tour
     * @return
     */
    List<Tour> queryByPid(Tour tour);

    int openBooking(int tourId);

    int closeBooking(int tourId);

    int startTour(int tourId);

    int cancelTour(int tourId);

    boolean forceCancelTour(int tourId);

    Long queryPIdByTourId(int tourId);
}
