package com.lvbaba.dao;

import com.lvbaba.entity.Flightdetail;
import com.lvbaba.entity.Traindetail;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TraindetailDao {
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

    List<Traindetail> query(Traindetail traindetail);

    /**
     * 通过tdid查询返回对应信息
     * @param traindetail
     * @return
     */
    Traindetail queryOne(Traindetail traindetail);

}
