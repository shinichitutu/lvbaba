package com.lvbaba.service.impl;

import com.lvbaba.dao.FlightDao;
import com.lvbaba.dao.FlightDatailDao;
import com.lvbaba.dao.TrainDao;
import com.lvbaba.dao.TrainDetailDao;
import com.lvbaba.entity.Flight;
import com.lvbaba.entity.Flightdetail;
import com.lvbaba.service.TransportationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author DBY
 * @date 2020/10/20 16:23
 */
@Service("transportService")
public class TransportationServiceImpl implements TransportationService {
    @Resource
    private FlightDao flightDao;
    @Resource
    private FlightDatailDao flightDatailDao;
    @Resource
    private TrainDao trainDao;
    @Resource
    private TrainDetailDao trainDetailDao;

    @Override
    public boolean insertFlight(Flight flight) {
        if (flight == null) {
            return false;
        }
        Flight flight1 = flightDao.queryByFlightName(flight.getfNumber());
        if (flight1 != null) {
            return false;
        }
        return flightDao.insertFlight(flight);
    }

    @Override
    public boolean deleteFlight(Flight flight) {
        if (flight == null) {
            return false;
        }
        return flightDao.deleteFlightById(flight);
    }

    @Override
    public boolean updateFlight(Flight flight) {
        if (flight == null) {
            return false;
        }
        return flightDao.updateFlightById(flight);
    }

    @Override
    public List<Flight> queryFlightAndDatailBydAIdAndAAreaId(Flight flight) {
        if (flight == null) {
            return null;
        }
        return flightDao.queryFlightAndDatailBydAIdAndAAreaId(flight);
    }

    @Override
    public boolean insertFlightDatail(Flightdetail flightdetail) {
        if (flightdetail == null) {
            return false;
        }
        return flightDatailDao.insertFlightDatail(flightdetail);
    }

    @Override
    public boolean updateFlightDatailById(Flightdetail flightdetail) {
        if (flightdetail == null) {
            return false;
        }
        return flightDatailDao.updateFlightDatailById(flightdetail);
    }

    @Override
    public boolean deleteFlightDatailById(Flightdetail flightdetail) {
        if (flightdetail == null) {
            return false;
        }
        return flightDatailDao.deleteFlightDatailById(flightdetail);
    }
}
