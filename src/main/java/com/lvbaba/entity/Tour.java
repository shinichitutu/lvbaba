package com.lvbaba.entity;

public class Tour {

    private long tourId;
    private long productId;
    private String dDate;
    private String roomDate;
    private String transType;
    private long goId;
    private long returnId;
    private long bookNum;
    private String tourStatus;
    private Flightdetail flightdetail;
    private Flight go_flight;
    private Flight re_flight;
    private Train go_train;
    private Train re_train;
    private Traindetail traindetail;

    public Tour() {
    }

    public Tour(long tourId) {
        this.tourId = tourId;
    }

    public Tour(long tourId, long bookNum) {
        this.tourId = tourId;
        this.bookNum = bookNum;
    }

    public long getTourId() {
        return tourId;
    }

    public void setTourId(long tourId) {
        this.tourId = tourId;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public String getdDate() {
        return dDate;
    }

    public void setdDate(String dDate) {
        this.dDate = dDate;
    }

    public String getRoomDate() {
        return roomDate;
    }

    public void setRoomDate(String roomDate) {
        this.roomDate = roomDate;
    }

    public String getTransType() {
        return transType;
    }

    public void setTransType(String transType) {
        this.transType = transType;
    }

    public long getGoId() {
        return goId;
    }

    public void setGoId(long goId) {
        this.goId = goId;
    }

    public long getReturnId() {
        return returnId;
    }

    public void setReturnId(long returnId) {
        this.returnId = returnId;
    }

    public long getBookNum() {
        return bookNum;
    }

    public void setBookNum(long bookNum) {
        this.bookNum = bookNum;
    }

    public String getTourStatus() {
        return tourStatus;
    }

    public void setTourStatus(String tourStatus) {
        this.tourStatus = tourStatus;
    }

    public Flightdetail getFlightdetail() {
        return flightdetail;
    }

    public void setFlightdetail(Flightdetail flightdetail) {
        this.flightdetail = flightdetail;
    }

    public Traindetail getTraindetail() {
        return traindetail;
    }

    public void setTraindetail(Traindetail traindetail) {
        this.traindetail = traindetail;
    }

    public Flight getGo_flight() {
        return go_flight;
    }

    public void setGo_flight(Flight go_flight) {
        this.go_flight = go_flight;
    }

    public Flight getRe_flight() {
        return re_flight;
    }

    public void setRe_flight(Flight re_flight) {
        this.re_flight = re_flight;
    }

    public Train getGo_train() {
        return go_train;
    }

    public void setGo_train(Train go_train) {
        this.go_train = go_train;
    }

    public Train getRe_train() {
        return re_train;
    }

    public void setRe_train(Train re_train) {
        this.re_train = re_train;
    }

    @Override
    public String toString() {
        return "Tour{" +
                "tourId=" + tourId +
                ", productId=" + productId +
                ", dDate='" + dDate + '\'' +
                ", roomDate='" + roomDate + '\'' +
                ", transType='" + transType + '\'' +
                ", goId=" + goId +
                ", returnId=" + returnId +
                ", bookNum=" + bookNum +
                ", tourStatus='" + tourStatus + '\'' +
                ", flightdetail=" + flightdetail +
                ", go_flight=" + go_flight +
                ", re_flight=" + re_flight +
                ", go_train=" + go_train +
                ", re_train=" + re_train +
                ", traindetail=" + traindetail +
                '}';
    }
}
