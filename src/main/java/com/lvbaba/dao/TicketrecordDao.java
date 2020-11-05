package com.lvbaba.dao;

import com.lvbaba.entity.Ticketrecord;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author DBY
 * @date 2020/11/4 13:08
 */
@Repository("TicketrecordDao")
public interface TicketrecordDao {
    /**
     * 向ticketrecord表中插入数据。
     *
     * @param ticketrecord
     * @return
     */
    boolean insertTicketRecord(Ticketrecord ticketrecord);

    /**
     * 通过记录id修改购买记录的机票状态已更新时间
     * @param ticketrecord
     * @return
     */
    boolean updateTicketRecordByFdrId(Ticketrecord ticketrecord);

    /**
     * 通过记录id删除该条记录
     * @param fdrId
     * @return
     */
    boolean deleteTicketRecordByFdrId(Long fdrId);

    /**
     * 通过登录用户的ID查询购票记录
     * @param userId
     * @return List<Ticketrecord>
     */
    List<Ticketrecord> queryAllByUerId(Long userId);

    /**
     * 通过记录表的主键ID查询购票记录
     * @param fdrId
     * @return Ticketrecord
     */
    Ticketrecord queryOneByFdrId(Long fdrId);
}
