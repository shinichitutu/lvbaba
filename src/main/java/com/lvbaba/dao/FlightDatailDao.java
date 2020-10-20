package com.lvbaba.dao;

import com.lvbaba.entity.Flightdetail;
import org.springframework.stereotype.Repository;

@Repository
public interface FlightDatailDao {
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
