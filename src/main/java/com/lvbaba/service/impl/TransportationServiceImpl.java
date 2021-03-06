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
    private TraindetailDao trainDetailDao;
    @Resource
    private AreaDao areaDao;
    @Resource
    private TourDao tourDao;

    @Override
    public boolean insertFlight(Flight flight) {
        if (flight == null) {
            return false;
        }
        Flight flight1 = flightDao.queryByFlightName(flight.getFlightNumber());
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
    public List<Flight> queryFlightAndDatailBydaIdAndarrAreaId(Flight flight) {
        if (flight == null) {
            return null;
        }
        List<Flight> flightList = flightDao.queryFlightAndDatailBydaIdAndarrAreaId(flight);
        if (flightList != null && flightList.size() > 0) {
            for (Flight f : flightList) {
                f.setD_area(areaDao.queryOne(new Area(f.getDaId())));
                f.setA_area(areaDao.queryOne(new Area(f.getArrAreaId())));
            }
        }
        return flightList;
    }

    @Override
    public List<Flightdetail> queryFlightInfoByAreaIdAndDate(Flight flight, String date) {
        List<Flight> flightList = flightDao.queryFlightByDateAndAreaId(flight);
        List<Flightdetail> flightdetailList = flightDatailDao.queryFlightDetailByFIdAndDate(date);
        List<Flightdetail> list = new ArrayList<>();
        if (null != flightList && !flightList.isEmpty() && flightdetailList != null && !flightdetailList.isEmpty()) {
            for (Flight f : flightList) {
                f.setD_area(areaDao.queryOne(new Area(f.getDaId())));
                f.setA_area(areaDao.queryOne(new Area(f.getArrAreaId())));
                for (Flightdetail fd : flightdetailList) {
                    if (f.getFlightId() == fd.getFlightId()) {
                        f.setFlightPrice(Double.valueOf(String.format("%.2f",f.getFlightPrice() * fd.getRatio())));
                        fd.setRatio(fd.getRatio() * 10);
                        fd.setFdTickets(f.getFlightCapacity() - fd.getFdTickets());
                        fd.setFlight(f);
                        list.add(fd);
                    }
                }
            }
        }
        return list;
    }

    @Override
    public List<Flight> queryAllFlight() {
        List<Flight> flightList = flightDao.queryAllFlight();
        List<Flight> list = new ArrayList<>();
        if (null != flightList && !flightList.isEmpty()) {
            for (Flight f : flightList) {
                f.setD_area(areaDao.queryOne(new Area(f.getDaId())));
                f.setA_area(areaDao.queryOne(new Area(f.getArrAreaId())));
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
        if (train1 != null) {
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
    public List<Train> queryTrainAndDatailBydaIdAndarrAreaId(Train train) {
        if (train == null) {
            return null;
        }
        List<Train> trainList = trainDao.queryTrainAndDatailBydaIdAndarrAreaId(train);
        if (trainList != null && trainList.size() > 0) {
            for (Train t : trainList) {
                t.setD_area(areaDao.queryOne(new Area(t.getdaId())));
                t.setA_area(areaDao.queryOne(new Area(t.getarrAreaId())));
            }
        }
        return trainList;
    }

    @Override
    public Train queTrainAndDeatilByTrainId(Long trainId) {
        Train train = new Train();
        train.setTrId(trainId);
        Train train1 = trainDao.queryOne(train);

        Traindetail traindetail = new Traindetail();
        traindetail.setTrId(train1.getTrId());

        List<Traindetail> traindetails = trainDetailDao.query(traindetail);
        Area d_area = areaDao.queryOne(new Area(train1.getdaId()));
        Area a_area = areaDao.queryOne(new Area(train1.getarrAreaId()));
        train1.setD_area(d_area);
        train1.setA_area(a_area);
        if (null!=traindetails) {
            train1.setTraindetailList(traindetails);
        }
        System.out.println("++++++++++++++++++++++++++++++++++++++++++++"+train1);
        return train1;
    }

    @Override
    public List<Train> queryAllTrain() {
        List<Train> trainList = trainDao.queryAllTrain();
        List<Train> list = new ArrayList<>();
        System.out.println("1111111111111111111");
        if (null != trainList && trainList.size()>0) {
            for (Train t : trainList) {
                if (t.getdaId()>0 && t.getarrAreaId()>0) {
                    t.setD_area(areaDao.queryOne(new Area(t.getdaId())));
                    t.setA_area(areaDao.queryOne(new Area(t.getarrAreaId())));
                }
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

    @Override
    public List<Flightdetail> query(Flightdetail flightdetail) {

        if (flightdetail == null) {
            return null;
        }

        List<Flightdetail> flightdetails = flightDatailDao.query(flightdetail);

        List<Flightdetail> flightdetails1 = new ArrayList<>();

        for (Flightdetail f : flightdetails) {
            Flight flight = new Flight(f.getFlightId());
            f.setFlight(flightDao.queryOne(flight));
            flightdetails1.add(f);
        }
        return flightdetails1;
    }

    @Override
    public List<Flight> query(Flight flight) {
        if (flight == null) {
            return null;
        }
        return flightDao.query(flight);
    }

    @Override
    public Flight queryOne(Flight flight) {
        if (flight == null) {
            return null;
        }
        return flightDao.queryOne(flight);
    }

    @Override
    public List<Train> query(Train train) {
        if (train == null) {
            return null;
        }
        return trainDao.query(train);
    }

    @Override
    public Train queryOne(Train train) {
        if (train == null) {
            return null;
        }
        return trainDao.queryOne(train);
    }

    @Override
    public List<Traindetail> query(Traindetail traindetail) {
        if (traindetail == null) {
            return null;
        }

        List<Traindetail> traindetails = trainDetailDao.query(traindetail);

        List<Traindetail> traindetails1 = new ArrayList<>();

        for (Traindetail t : traindetails) {
            Train train = new Train(t.getTrId());
            t.setTrain(trainDao.queryOne(train));
            traindetails1.add(t);
        }
        return traindetails1;

    }

    @Override
    public Traindetail queryOne(Traindetail traindetail) {
        if (traindetail == null) {
            return null;
        }
        return trainDetailDao.queryOne(traindetail);
    }

    /*计算飞机票价*/
    @Override
    public Double calculateFlightPrice(Long fdId) {
        Flightdetail flightdetail = new Flightdetail();
        flightdetail.setFdId(fdId);
        flightdetail = flightDatailDao.query(flightdetail).get(0);
        Long flightId = flightdetail.getFlightId();
        Flight flight = new Flight();
        flight.setFlightId(flightId);
        Flight flight1 = queryOne(flight);
        return flightdetail.getRatio() * flight1.getFlightPrice();
    }

    /*判断机票是否充足，num为订票数量*/
    @Override
    public boolean isFlightTicketEnough(Long tourId, int num) {
        Tour tour = new Tour();
        tour.setTourId(tourId);
        Tour tour1 = tourDao.query(tour);
        Flightdetail flightdetail = flightDatailDao.queryByFdId(tour1.getGoId());

        Flight flight = new Flight();
        flight.setFlightId(flightdetail.getFlightId());
        flight = flightDao.queryOne(flight);
        if (flight.getFlightCapacity() - flightdetail.getFdTickets() >= num) {
            return true;
        } else {
            return false;
        }
    }

    /*判断火车票是否充足，num为订票数量*/
    @Override
    public boolean isTrainTicketEnough(Long tourId, int num) {
        Tour tour = new Tour();
        tour.setTourId(tourId);
        Tour tour1 = tourDao.query(tour);
        Traindetail traindetail = new Traindetail();
        traindetail.setTdId(tour1.getGoId());
        Traindetail traindetail1 = trainDetailDao.queryOne(traindetail);

        Train train = new Train();
        train.setTrId(traindetail1.getTrId());
        train = trainDao.queryOne(train);
        if (train.getTrCapacity() - traindetail1.getTdTickets() >= num) {
            return true;
        } else {
            return false;
        }

    }
}
