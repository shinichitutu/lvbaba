package com.lvbaba.entity;

public class Ticketrecord {

  private long fdrId;
  private String flightName;
  private String flightCanpany;
  private String departureArea;
  private String destinationArea;
  private String departureTime;
  private String arrivalTime;
  private double flightPrice;
  private String userName;
  private String userIdcard;
  private String userPhone;
  private String createDate;
  private String flightStatus;
  private String updateDate;


  public long getFdrId() {
    return fdrId;
  }

  public void setFdrId(long fdrId) {
    this.fdrId = fdrId;
  }


  public String getFlightName() {
    return flightName;
  }

  public void setFlightName(String flightName) {
    this.flightName = flightName;
  }


  public String getFlightCanpany() {
    return flightCanpany;
  }

  public void setFlightCanpany(String flightCanpany) {
    this.flightCanpany = flightCanpany;
  }


  public String getDepartureArea() {
    return departureArea;
  }

  public void setDepartureArea(String departureArea) {
    this.departureArea = departureArea;
  }


  public String getDestinationArea() {
    return destinationArea;
  }

  public void setDestinationArea(String destinationArea) {
    this.destinationArea = destinationArea;
  }


  public String getDepartureTime() {
    return departureTime;
  }

  public void setDepartureTime(String departureTime) {
    this.departureTime = departureTime;
  }


  public String getArrivalTime() {
    return arrivalTime;
  }

  public void setArrivalTime(String arrivalTime) {
    this.arrivalTime = arrivalTime;
  }


  public double getFlightPrice() {
    return flightPrice;
  }

  public void setFlightPrice(double flightPrice) {
    this.flightPrice = flightPrice;
  }


  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }


  public String getUserIdcard() {
    return userIdcard;
  }

  public void setUserIdcard(String userIdcard) {
    this.userIdcard = userIdcard;
  }


  public String getUserPhone() {
    return userPhone;
  }

  public void setUserPhone(String userPhone) {
    this.userPhone = userPhone;
  }


  public String getCreateDate() {
    return createDate;
  }

  public void setCreateDate(String createDate) {
    this.createDate = createDate;
  }


  public String getFlightStatus() {
    return flightStatus;
  }

  public void setFlightStatus(String flightStatus) {
    this.flightStatus = flightStatus;
  }


  public String getUpdateDate() {
    return updateDate;
  }

  public void setUpdateDate(String updateDate) {
    this.updateDate = updateDate;
  }

  @Override
  public String toString() {
    return "Ticketrecord{" +
            "fdrId=" + fdrId +
            ", flightName='" + flightName + '\'' +
            ", flightCanpany='" + flightCanpany + '\'' +
            ", departureArea='" + departureArea + '\'' +
            ", destinationArea='" + destinationArea + '\'' +
            ", departureTime=" + departureTime +
            ", arrivalTime=" + arrivalTime +
            ", flightPrice=" + flightPrice +
            ", userName='" + userName + '\'' +
            ", userIdcard='" + userIdcard + '\'' +
            ", userPhone='" + userPhone + '\'' +
            ", createDate='" + createDate + '\'' +
            ", flightStatus='" + flightStatus + '\'' +
            ", updateDate='" + updateDate + '\'' +
            '}';
  }
}
