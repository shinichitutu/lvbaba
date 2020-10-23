package com.lvbaba.dao;

import com.lvbaba.entity.Flight;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FlightDao {
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
    boolean deleteFlightById(Flight flight);

    /**
     * 更新航班信息
     * @param flight
     * @return
     */
    boolean updateFlightById(Flight flight);

    /**
     * 通过航班的出发地和目的地ID查询对应航班信息
     * @param flight
     * @return
     */
    List<Flight> queryFlightAndDatailBydAIdAndAAreaId(Flight flight);
}
