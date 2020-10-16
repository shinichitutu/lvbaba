package com.lvbaba.entity;


public class Train {

  private long trId;
  private String trNumber;
  private String trDTime;
  private long dAId;
  private long aAreaId;
  private long trCapacity;
  private double trPrice;


  public long getTrId() {
    return trId;
  }

  public void setTrId(long trId) {
    this.trId = trId;
  }


  public String getTrNumber() {
    return trNumber;
  }

  public void setTrNumber(String trNumber) {
    this.trNumber = trNumber;
  }


  public String getTrDTime() {
    return trDTime;
  }

  public void setTrDTime(String trDTime) {
    this.trDTime = trDTime;
  }


  public long getDAId() {
    return dAId;
  }

  public void setDAId(long dAId) {
    this.dAId = dAId;
  }


  public long getAAreaId() {
    return aAreaId;
  }

  public void setAAreaId(long aAreaId) {
    this.aAreaId = aAreaId;
  }


  public long getTrCapacity() {
    return trCapacity;
  }

  public void setTrCapacity(long trCapacity) {
    this.trCapacity = trCapacity;
  }


  public double getTrPrice() {
    return trPrice;
  }

  public void setTrPrice(double trPrice) {
    this.trPrice = trPrice;
  }

}
