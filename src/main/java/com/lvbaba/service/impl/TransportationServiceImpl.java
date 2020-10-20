package com.lvbaba.service.impl;

import com.lvbaba.dao.FlightDao;
import com.lvbaba.dao.FlightDatailDao;
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
@Service
public class TransportationServiceImpl implements TransportationService{
    @Resource
    private FlightDao flightDao;
    @Resource
    private FlightDatailDao flightDatailDao;

    @Override
    public boolean insertFlight(Flight flight) {
        return false;
    }

    @Override
    public boolean deleteFlight(Flight flight) {
        return false;
    }

    @Override
    public boolean updateFlight(Flight flight) {
        return false;
    }

    @Override
    public List<Flight> queryFlightAndDatailBydAIdAndAAreaId(Flight flight) {
        return null;
    }

    @Override
    public boolean insertFlightDatail(Flightdetail flightdetail) {
        return false;
    }

    @Override
    public boolean updateFlightDatailById(Flightdetail flightdetail) {
        return false;
    }

    @Override
    public boolean deleteFlightDatailById(Flightdetail flightdetail) {
        return false;
    }
}
