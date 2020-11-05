package com.lvbaba.service;

import com.lvbaba.entity.Ticketrecord;

import java.util.List;

public interface TicketrecordService {
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
}
