package com.lvbaba.service;

import com.lvbaba.entity.Flight;
import com.lvbaba.entity.Flightdetail;
import com.lvbaba.entity.Train;
import com.lvbaba.entity.Traindetail;

import java.util.List;

public interface TransportationService {
    /**
     * 添加航班信息
     * @param flight
     * @return
     */
    boolean insertFlight(Flight flight);

    /**
     * 删除航班信息
     * @param flight
     * @return
     */
    boolean deleteFlight(Flight flight);

    /**
     * 更新航班信息
     * @param flight
     * @return
     */
    boolean updateFlight(Flight flight);

    /**
     * 通过航班的出发地和目的地ID查询对应航班信息
     * @param flight
     * @return
     */
    List<Flight> queryFlightAndDatailBydaIdAndarrAreaId(Flight flight);

    /**
     * 通过航班的出发地和目的地ID以及出发时间查询对应航班信息，根据日期查询detail的满足情况的信息
     * @param  flight, date, time
     * @return List<Flightdetail>
     */
    List<Flightdetail> queryFlightInfoByAreaIdAndDate(Flight flight,String date);

    /**
     * 管理员查看所有的航班信息
     * @param
     * @return
     */
    List<Flight> queryAllFlight();

    /**
     * 向Flightdetail表中插入数据
     * @param flightdetail
     * @return
     */
    boolean insertFlightDatail(Flightdetail flightdetail);


    /**
     * 更新FlightDatail表中数据
     * @param flightdetail
     * @return
     */
    boolean updateFlightDatailById(Flightdetail flightdetail);

    /**
     * 删除FlightDatail表中指定数据
     * @param flightdetail
     * @return
     */
    boolean deleteFlightDatailById(Flightdetail flightdetail);

    /**
     * 添加火车信息
     * @param train
     * @return
     */
    boolean insertTrain(Train train);

    /**
     * 删除火车信息
     * @param train
     * @return
     */
    boolean deleteTrainById(Train train);

    /**
     * 更新火车信息
     * @param train
     * @return
     */
    boolean updateTrainById(Train train);

    /**
     * 通过火车的出发地和目的地ID查询对应航班信息
     * @param train
     * @return List<Flight>集合
     */
    List<Train> queryTrainAndDatailBydaIdAndarrAreaId(Train train);

    /**
     * 管理员查看所有的火车班次信息
     * @param
     * @return List<Flight>
     */
    List<Train> queryAllTrain();

    /**
     * 向traindetail表中插入数据
     * @param traindetail
     * @return
     */
    boolean insertTraindetail(Traindetail traindetail);


    /**
     * 更新traindetail表中数据
     * @param traindetail
     * @return
     */
    boolean updateTraindetailById(Traindetail traindetail);

    /**
     * 删除traindetail表中指定数据
     * @param traindetail
     * @return
     */
    boolean deleteTraindetailById(Traindetail traindetail);

    /**
     * 查询航班明细表集合
     * @param flightdetail
     * @return
     */
    List<Flightdetail> query(Flightdetail flightdetail);

    /**
     * 查询航班集合
     * @param flight
     * @return
     */
    List<Flight> query(Flight flight);

    /**
     * 查询单个航班
     * @param flight
     * @return
     */
    Flight queryOne(Flight flight);

    /**
     * 查询火车集合
     * @param train
     * @return
     */
    List<Train> query(Train train);

    /**
     * 查询单个火车
     * @param train
     * @return
     */
    Train queryOne(Train train);

    /**
     * 查询火车明细表集合
     * @param traindetail
     * @return
     */
    List<Traindetail> query(Traindetail traindetail);

    /**
     * 查询单个火车明细表
     * @param traindetail
     * @return
     */
    Traindetail queryOne(Traindetail traindetail);

}
