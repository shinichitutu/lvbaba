package com.lvbaba.service.impl;

import com.lvbaba.dao.FlightDatailDao;
import com.lvbaba.dao.TicketrecordDao;
import com.lvbaba.dao.UserDao;
import com.lvbaba.entity.Flightdetail;
import com.lvbaba.entity.Ticketrecord;
import com.lvbaba.entity.User;
import com.lvbaba.service.TicketrecordService;
import com.lvbaba.utli.Util;
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
    @Resource
    private UserDao userDao;

    @Override
    public boolean insertTicketRecord(Ticketrecord ticketrecord) {
        if (ticketrecord==null){
            return false;
        }
        boolean flag1 = ticketrecordDao.insertTicketRecord(ticketrecord);
        boolean flag2 = flightDatailDao.updateFlightDetailTickets(ticketrecord.getFdId(),1L);
        User user = new User();
        user.setuId(ticketrecord.getUserId());
        user.setBalance(-ticketrecord.getFlightPrice());
        boolean flag3 = userDao.updateUser(user);
        return flag1&&flag2&&flag3?true:false;
    }

    @Override
    public boolean updateTicketRecordByFdrId(Ticketrecord ticketrecord) {
        if (ticketrecord==null){
            return false;
        }
        boolean flag1 = ticketrecordDao.updateTicketRecordByFdrId(ticketrecord);
        Ticketrecord ticketrecord1 = ticketrecordDao.queryOneByFdrId(ticketrecord.getFdrId());
        Flightdetail flightdetail = flightDatailDao.queryByFdId(ticketrecord1.getFdId());
        double retrunRatio = Util.refund(flightdetail.getFdDate());
        User user = new User();
        user.setuId(ticketrecord1.getUserId());
        user.setBalance(ticketrecord1.getFlightPrice()*(1-retrunRatio));
        boolean flag3 = userDao.updateUser(user);
        boolean flag2 =false;
        if (ticketrecord1!=null) {
            flag2 = flightDatailDao.updateFlightDetailTickets(ticketrecord1.getFdId(), -1L);
        }
        return flag1&&flag2&&flag3?true:false;
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
