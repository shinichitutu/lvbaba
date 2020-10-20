package com.lvbaba.service;

import com.lvbaba.entity.Flight;
import com.lvbaba.entity.Flightdetail;

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
    List<Flight> queryFlightAndDatailBydAIdAndAAreaId(Flight flight);

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
}
