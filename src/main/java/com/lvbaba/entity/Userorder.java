package com.lvbaba.entity;


public class Userorder {

  private long oId;
  private long uId;
  private long tId;
  private double oPrice;
  private String oStatus;

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
