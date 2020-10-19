package com.lvbaba.entity;


public class Flightdetail {

  private long fdId;
  private long fId;
  private String fdDate;
  private long fdTickets;
  private double ratio;


  public long getFdId() {
    return fdId;
  }

  public void setFdId(long fdId) {
    this.fdId = fdId;
  }


  public long getFId() {
    return fId;
  }

  public void setFId(long fId) {
    this.fId = fId;
  }


  public String getFdDate() {
    return fdDate;
  }

  public void setFdDate(String fdDate) {
    this.fdDate = fdDate;
  }


  public long getFdTickets() {
    return fdTickets;
  }

  public void setFdTickets(long fdTickets) {
    this.fdTickets = fdTickets;
  }


  public double getRatio() {
    return ratio;
  }

  public void setRatio(double ratio) {
    this.ratio = ratio;
  }

  @Override
  public String toString() {
    return "Flightdetail{" +
            "fdId=" + fdId +
            ", fId=" + fId +
            ", fdDate='" + fdDate + '\'' +
            ", fdTickets=" + fdTickets +
            ", ratio=" + ratio +
            '}';
  }
}
