package com.lvbaba.dao;

import com.lvbaba.entity.Flightdetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    List<Flightdetail> query(Flightdetail flightdetail);

    /**
     * 通过传过来的日期和航班Id查询数据
     * @param date
     * @return List<Flightdetail>
     */
    List<Flightdetail> queryFlightDetailByFIdAndDate(String date);

    boolean updateFlightDetailTickets(@Param("fdId") Long fdId,@Param("tickets")  Long tickets);

    /**
     * 通过fdid查询返回对应信息
     * @param fdId
     * @return
     */
    Flightdetail queryByFdId(Long fdId);
}
