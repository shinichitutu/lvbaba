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
  private Flight flight;
  private Train train;
  private Traindetail traindetail;

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

  public Flight getFlight() {
    return flight;
  }

  public void setFlight(Flight flight) {
    this.flight = flight;
  }

  public Train getTrain() {
    return train;
  }

  public void setTrain(Train train) {
    this.train = train;
  }

  public Traindetail getTraindetail() {
    return traindetail;
  }

  public void setTraindetail(Traindetail traindetail) {
    this.traindetail = traindetail;
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
            ", flight=" + flight +
            ", train=" + train +
            ", traindetail=" + traindetail +
            '}';
  }
}
