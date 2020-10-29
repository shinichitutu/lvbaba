package com.lvbaba.entity;


public class Product {

  private long pId;
  private long daId;
  private long arrAreaId;
  private long limLow;
  private long limUp;
  private long days;
  private long hotelId;
  private String pName;
  private String pFee;
  private double pScore;

  public long getpId() {
    return pId;
  }

  public void setpId(long pId) {
    this.pId = pId;
  }

  public long getdaId() {
    return daId;
  }

  public void setdaId(long daId) {
    this.daId = daId;
  }

  public long getarrAreaId() {
    return arrAreaId;
  }

  public void setarrAreaId(long arrAreaId) {
    this.arrAreaId = arrAreaId;
  }

  public long getLimLow() {
    return limLow;
  }

  public void setLimLow(long limLow) {
    this.limLow = limLow;
  }

  public long getLimUp() {
    return limUp;
  }

  public void setLimUp(long limUp) {
    this.limUp = limUp;
  }

  public long getDays() {
    return days;
  }

  public void setDays(long days) {
    this.days = days;
  }

  public long getHotelId() {
    return hotelId;
  }

  public void setHotelId(long hotelId) {
    this.hotelId = hotelId;
  }

  public String getpName() {
    return pName;
  }

  public void setpName(String pName) {
    this.pName = pName;
  }

  public String getpFee() {
    return pFee;
  }

  public void setpFee(String pFee) {
    this.pFee = pFee;
  }

  public double getpScore() {
    return pScore;
  }

  public void setpScore(double pScore) {
    this.pScore = pScore;
  }

  @Override
  public String toString() {
    return "Product{" +
            "pId=" + pId +
            ", daId=" + daId +
            ", arrAreaId=" + arrAreaId +
            ", limLow=" + limLow +
            ", limUp=" + limUp +
            ", days=" + days +
            ", hotelId=" + hotelId +
            ", pName='" + pName + '\'' +
            ", pFee='" + pFee + '\'' +
            ", pScore=" + pScore +
            '}';
  }
}
