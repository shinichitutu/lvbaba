package com.lvbaba.service.impl;

import com.lvbaba.dao.*;
import com.lvbaba.entity.*;
import com.lvbaba.service.TransportationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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
    @Resource
    private AreaDao areaDao;

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
    public List<Flight> queryFlightAndDatailBydaIdAndAAreaId(Flight flight) {
        if (flight == null) {
            return null;
        }
        return flightDao.queryFlightAndDatailBydaIdAndAAreaId(flight);
    }

    @Override
    public List<Flight> queryAllFlight() {
        List<Flight> flightList = flightDao.queryAllFlight();
        List<Flight> list = new ArrayList<>();
        if (null!=flightList && !flightList.isEmpty()){
            for (Flight f:flightList) {
                f.setD_area(areaDao.queryOne(new Area(f.getdaId())));
                f.setA_area(areaDao.queryOne(new Area(f.getaAreaId())));
                list.add(f);
            }
        }
        return list;
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

    @Override
    public boolean insertTrain(Train train) {
        if (train == null) {
            return false;
        }
        Train train1 = trainDao.queryByTrainName(train.getTrNumber());
        if (train1!=null){
            return false;
        }
        return trainDao.insertTrain(train);
    }

    @Override
    public boolean deleteTrainById(Train train) {
        if (train == null) {
            return false;
        }
        return trainDao.deleteTrainById(train);
    }

    @Override
    public boolean updateTrainById(Train train) {
        if (train == null) {
            return false;
        }
        return trainDao.updateTrainById(train);
    }

    @Override
    public List<Train> queryTrainAndDatailBydaIdAndAAreaId(Train train) {
        if (train == null) {
            return null;
        }
        return trainDao.queryTrainAndDatailBydaIdAndAAreaId(train);
    }

    @Override
    public List<Train> queryAllTrain() {
        List<Train> trainList = trainDao.queryAllTrain();
        List<Train> list = new ArrayList<>();
        if (null!=trainList && !trainList.isEmpty()){
            for (Train t:trainList) {
                t.setD_area(areaDao.queryOne(new Area(t.getdaId())));
                t.setA_area(areaDao.queryOne(new Area(t.getaAreaId())));
                list.add(t);
            }
        }
        return list;
    }

    @Override
    public boolean insertTraindetail(Traindetail traindetail) {
        if (traindetail == null) {
            return false;
        }
        return trainDetailDao.insertTraindetail(traindetail);
    }

    @Override
    public boolean updateTraindetailById(Traindetail traindetail) {
        if (traindetail == null) {
            return false;
        }
        return trainDetailDao.updateTraindetailById(traindetail);
    }

    @Override
    public boolean deleteTraindetailById(Traindetail traindetail) {
        if (traindetail == null) {
            return false;
        }
        return trainDetailDao.deleteTraindetailById(traindetail);
    }
}
