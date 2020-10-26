package com.lvbaba.entity;

import com.lvbaba.entity.Area;
import com.lvbaba.entity.Flightdetail;

import java.util.ArrayList;
import java.util.List;

public class Flight {

  private long fId;
  private String flightNumber;
  private String fCompany;
  private String fDTime;
  private String fATime;
  private long daId;
  private long aAreaId;
  private long fCapacity;
  private double fPrice;
  private List<Flightdetail> flightdetails = new ArrayList<>();
  private Area d_area;
  private Area a_area;

  public long getfId() {
    return fId;
  }

  public void setfId(long fId) {
    this.fId = fId;
  }

  public String getflightNumber() {
    return flightNumber;
  }

  public void setflightNumber(String flightNumber) {
    this.flightNumber = flightNumber;
  }

  public String getfCompany() {
    return fCompany;
  }

  public void setfCompany(String fCompany) {
    this.fCompany = fCompany;
  }

  public String getfDTime() {
    return fDTime;
  }

  public void setfDTime(String fDTime) {
    this.fDTime = fDTime;
  }

  public String getfATime() {
    return fATime;
  }

  public void setfATime(String fATime) {
    this.fATime = fATime;
  }

  public long getdaId() {
    return daId;
  }

  public void setdaId(long daId) {
    this.daId = daId;
  }

  public long getaAreaId() {
    return aAreaId;
  }

  public void setaAreaId(long aAreaId) {
    this.aAreaId = aAreaId;
  }

  public long getfCapacity() {
    return fCapacity;
  }

  public void setfCapacity(long fCapacity) {
    this.fCapacity = fCapacity;
  }

  public double getfPrice() {
    return fPrice;
  }

  public void setfPrice(double fPrice) {
    this.fPrice = fPrice;
  }
  //  public long getFId() {
//    return fId;
//  }
//
//  public void setFId(long fId) {
//    this.fId = fId;
//  }
//
//  public String getflightNumber() {
//    return flightNumber;
//  }
//
//  public void setflightNumber(String flightNumber) {
//    this.flightNumber = flightNumber;
//  }
//
//
//  public String getFCompany() {
//    return fCompany;
//  }
//
//  public void setFCompany(String fCompany) {
//    this.fCompany = fCompany;
//  }
//
//
//  public String getFDTime() {
//    return fDTime;
//  }
//
//  public void setFDTime(String fDTime) {
//    this.fDTime = fDTime;
//  }
//
//
//  public String getFATime() {
//    return fATime;
//  }
//
//  public void setFATime(String fATime) {
//    this.fATime = fATime;
//  }
//
//
//  public long getDaId() {
//    return daId;
//  }
//
//  public void setDaId(long daId) {
//    this.daId = daId;
//  }
//
//
//  public long getAAreaId() {
//    return aAreaId;
//  }
//
//  public void setAAreaId(long aAreaId) {
//    this.aAreaId = aAreaId;
//  }
//
//  public long getFCapacity() {
//    return fCapacity;
//  }
//
//  public void setFCapacity(long fCapacity) {
//    this.fCapacity = fCapacity;
//  }
//
//
//  public double getFPrice() {
//    return fPrice;
//  }
//
//  public void setFPrice(double fPrice) {
//    this.fPrice = fPrice;
//  }

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
            "fId=" + fId +
            ", flightNumber='" + flightNumber + '\'' +
            ", fCompany='" + fCompany + '\'' +
            ", fDTime='" + fDTime + '\'' +
            ", fATime='" + fATime + '\'' +
            ", daId=" + daId +
            ", aAreaId=" + aAreaId +
            ", fCapacity=" + fCapacity +
            ", fPrice=" + fPrice +
            ", flightdetails=" + flightdetails +
            ", d_area=" + d_area +
            ", a_area=" + a_area +
            '}';
  }
}
