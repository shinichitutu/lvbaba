package com.lvbaba.dao;

import com.lvbaba.entity.Flight;
import com.lvbaba.entity.Train;

import java.util.List;

public interface TrainDao {
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
     * @return
     */
    List<Flight> queryTrainAndDatailBydAIdAndAAreaId(Train train);
}
