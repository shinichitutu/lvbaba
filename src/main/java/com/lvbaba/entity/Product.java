package com.lvbaba.entity;


public class Product {

  private long pId;
  private long dAId;
  private long aAreaId;
  private long limLow;
  private long limUp;
  private long days;
  private long rId;
  private String pName;
  private String pFee;
  private double pScore;


  public long getPId() {
    return pId;
  }

  public void setPId(long pId) {
    this.pId = pId;
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


  public long getRId() {
    return rId;
  }

  public void setRId(long rId) {
    this.rId = rId;
  }


  public String getPName() {
    return pName;
  }

  public void setPName(String pName) {
    this.pName = pName;
  }


  public String getPFee() {
    return pFee;
  }

  public void setPFee(String pFee) {
    this.pFee = pFee;
  }


  public double getPScore() {
    return pScore;
  }

  public void setPScore(double pScore) {
    this.pScore = pScore;
  }

}
