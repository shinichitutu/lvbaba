package com.lvbaba.entity;


public class Userorder {

  private long oId;
  private long uId;
  private long tId;
  private double oPrice;
  private String oStatus;
  private String oTime;
  private String pTime;

  public long getoId() {
    return oId;
  }

  public void setoId(long oId) {
    this.oId = oId;
  }

  public long getuId() {
    return uId;
  }

  public void setuId(long uId) {
    this.uId = uId;
  }

  public long gettId() {
    return tId;
  }

  public void settId(long tId) {
    this.tId = tId;
  }

  public double getoPrice() {
    return oPrice;
  }

  public void setoPrice(double oPrice) {
    this.oPrice = oPrice;
  }

  public String getoStatus() {
    return oStatus;
  }

  public void setoStatus(String oStatus) {
    this.oStatus = oStatus;
  }

  public String getoTime() {
    return oTime;
  }

  public void setoTime(String oTime) {
    this.oTime = oTime;
  }

  public String getpTime() {
    return pTime;
  }

  public void setpTime(String pTime) {
    this.pTime = pTime;
  }

  @Override
  public String toString() {
    return "Userorder{" +
            "oId=" + oId +
            ", uId=" + uId +
            ", tId=" + tId +
            ", oPrice=" + oPrice +
            ", oStatus='" + oStatus + '\'' +
            '}';
  }
}
