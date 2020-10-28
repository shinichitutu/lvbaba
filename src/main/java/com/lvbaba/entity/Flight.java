package com.lvbaba.entity;

import com.lvbaba.entity.Area;
import com.lvbaba.entity.Flightdetail;

import java.util.ArrayList;
import java.util.List;

public class Flight {
  private long flightId;
  private String flightNumber;
  private String flightCompany;
  private String flightDTime;
  private String flightATime;
  private long daId;
  private long arrAreaId;
  private long flightCapacity;
  private double flightPrice;
  private List<Flightdetail> flightdetails = new ArrayList<>();
  private Area d_area;
  private Area a_area;

  public Flight(long flightId, String flightNumber, String flightCompany, String flightDTime, String flightATime, long daId, long arrAreaId, long flightCapacity, double flightPrice, List<Flightdetail> flightdetails, Area d_area, Area a_area) {
    this.flightId = flightId;
    this.flightNumber = flightNumber;
    this.flightCompany = flightCompany;
    this.flightDTime = flightDTime;
    this.flightATime = flightATime;
    this.daId = daId;
    this.arrAreaId = arrAreaId;
    this.flightCapacity = flightCapacity;
    this.flightPrice = flightPrice;
    this.flightdetails = flightdetails;
    this.d_area = d_area;
    this.a_area = a_area;
  }

  public Flight() {
  }

  public long getFlightId() {
    return flightId;
  }

  public void setFlightId(long flightId) {
    this.flightId = flightId;
  }

  public String getFlightNumber() {
    return flightNumber;
  }

  public void setFlightNumber(String flightNumber) {
    this.flightNumber = flightNumber;
  }

  public String getFlightCompany() {
    return flightCompany;
  }

  public void setFlightCompany(String flightCompany) {
    this.flightCompany = flightCompany;
  }

  public String getFlightDTime() {
    return flightDTime;
  }

  public void setFlightDTime(String flightDTime) {
    this.flightDTime = flightDTime;
  }

  public String getFlightATime() {
    return flightATime;
  }

  public void setFlightATime(String flightATime) {
    this.flightATime = flightATime;
  }

  public long getDaId() {
    return daId;
  }

  public void setDaId(long daId) {
    this.daId = daId;
  }

  public long getArrAreaId() {
    return arrAreaId;
  }

  public void setArrAreaId(long arrAreaId) {
    this.arrAreaId = arrAreaId;
  }

  public long getFlightCapacity() {
    return flightCapacity;
  }

  public void setFlightCapacity(long flightCapacity) {
    this.flightCapacity = flightCapacity;
  }

  public double getFlightPrice() {
    return flightPrice;
  }

  public void setFlightPrice(double flightPrice) {
    this.flightPrice = flightPrice;
  }

  public List<Flightdetail> getFlightdetails() {
    return flightdetails;
  }

  public void setFlightdetails(List<Flightdetail> flightdetails) {
    this.flightdetails = flightdetails;
  }

  public Area getD_area() {
    return d_area;
  }

  public void setD_area(Area d_area) {
    this.d_area = d_area;
  }

  public Area getA_area() {
    return a_area;
  }

  public void setA_area(Area a_area) {
    this.a_area = a_area;
  }

  @Override
  public String toString() {
    return "Flight{" +
            "flightId=" + flightId +
            ", flightNumber='" + flightNumber + '\'' +
            ", flightCompany='" + flightCompany + '\'' +
            ", flightDTime='" + flightDTime + '\'' +
            ", flightATime='" + flightATime + '\'' +
            ", daId=" + daId +
            ", arrAreaId=" + arrAreaId +
            ", flightCapacity=" + flightCapacity +
            ", flightPrice=" + flightPrice +
            ", flightdetails=" + flightdetails +
            ", d_area=" + d_area +
            ", a_area=" + a_area +
            '}';
  }
}
