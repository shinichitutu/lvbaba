package com.lvbaba.service.impl;

import com.lvbaba.dao.FlightDatailDao;
import com.lvbaba.dao.TicketrecordDao;
import com.lvbaba.entity.Ticketrecord;
import com.lvbaba.service.TicketrecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author DBY
 * @date 2020/11/4 14:01
 */
@Service("ticketrecordService")
public class TicketrecordServiceImpl implements TicketrecordService {
    @Resource
    private TicketrecordDao ticketrecordDao;
    @Resource
    private FlightDatailDao flightDatailDao;

    @Override
    public boolean insertTicketRecord(Ticketrecord ticketrecord) {
        if (ticketrecord==null){
            return false;
        }
        boolean flag1 = ticketrecordDao.insertTicketRecord(ticketrecord);
        boolean flag2 = flightDatailDao.updateFlightDetailTickets(ticketrecord.getFdId(),1L);
        return flag1&&flag2?true:false;
    }

    @Override
    public boolean updateTicketRecordByFdrId(Ticketrecord ticketrecord) {
        if (ticketrecord==null){
            return false;
        }
        System.out.println("-----------------=======---------------"+ticketrecord);
        boolean flag1 = ticketrecordDao.updateTicketRecordByFdrId(ticketrecord);
        Ticketrecord ticketrecord1 = ticketrecordDao.queryOneByFdrId(ticketrecord.getFdrId());
        System.out.println("============================================"+ticketrecord1);
        boolean flag2 =false;
        if (ticketrecord1!=null) {
            flag2 = flightDatailDao.updateFlightDetailTickets(ticketrecord1.getFdId(), -1L);
        }
        return flag1&&flag2?true:false;
    }

    @Override
    public boolean deleteTicketRecordByFdrId(Long fdrId) {
        return ticketrecordDao.deleteTicketRecordByFdrId(fdrId);
    }

    @Override
    public List<Ticketrecord> queryAllByUerId(Long userId) {
        return ticketrecordDao.queryAllByUerId(userId);
    }
}
