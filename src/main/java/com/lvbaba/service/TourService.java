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

    /**
     * 开放预订
     * @param tourId
     * @return
     */
    int openBooking(int tourId);

    /**
     * 关闭预订
     * @param tourId
     * @return
     */
    int closeBooking(int tourId);

    /**
     *发团
     * @param tourId
     * @return
     */
    int startTour(int tourId);

    /**
     * 取消旅行团
     * @param tourId
     * @return
     */
    int cancelTour(int tourId);

    /**
     * 强制删除旅行团
     * @param tourId
     * @return
     */
    boolean forceCancelTour(int tourId);

    /**
     * 通过TourId查询PId
     * @param tourId
     * @return
     */
    Long queryPIdByTourId(int tourId);

    /*未成团，已成团间的切换*/
    boolean updateTourStatus(int tourId);


    /*判断该旅行团是否超额,num为准备预定的人数*/
    boolean isTourNumEnough(long tourId,int num);
}
