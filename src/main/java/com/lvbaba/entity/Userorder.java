package com.lvbaba.entity;


public class Userorder {

  private long oId;
  private long uId;
  private long tId;
  private double oPrice;
  private String oStatus;


  public long getOId() {
    return oId;
  }

  public void setOId(long oId) {
    this.oId = oId;
  }


  public long getUId() {
    return uId;
  }

  public void setUId(long uId) {
    this.uId = uId;
  }


  public long getTId() {
    return tId;
  }

  public void setTId(long tId) {
    this.tId = tId;
  }


  public double getOPrice() {
    return oPrice;
  }

  public void setOPrice(double oPrice) {
    this.oPrice = oPrice;
  }


  public String getOStatus() {
    return oStatus;
  }

  public void setOStatus(String oStatus) {
    this.oStatus = oStatus;
  }

}
