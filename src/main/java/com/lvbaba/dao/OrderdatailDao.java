package com.lvbaba.dao;

import com.lvbaba.entity.Orderdatail;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderdatailDao {

    /**
     * 向OrderDetail表中插入数据
     * @param orderdatail
     * @return
     */
    boolean insertOrderDetail(Orderdatail orderdatail);

    /**
     * 通过主键id更新OrderDetail表中信息
     * @param orderdatail
     * @return
     */
    boolean updateOrderDatailById(Orderdatail orderdatail);

    /**
     * 通过主键id删除OrderDetail表中信息
     * @param orderdatail
     * @return
     */
    boolean deleteOrderDatailById(Orderdatail orderdatail);

    /**
     * 通过订单的id查找满足条件的所有订单详情信息
     * @param orderdatail
     * @return
     */
    List<Orderdatail> queryOrderDatailByOId(Orderdatail orderdatail);

}
