package com.lvbaba.dao;

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
    List<Train> queryTrainAndDatailBydaIdAndarrAreaId(Train train);

    /**
     * 通过火车班次的名字查询结果，用于判重
     * @param trainName
     * @return
     */
    Train queryByTrainName(String trainName);

    /**
     * 管理员查看所有的火车班次信息
     * @return
     */
    List<Train> queryAllTrain();
}
