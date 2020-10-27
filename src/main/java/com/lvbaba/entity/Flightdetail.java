package com.lvbaba.entity;


public class Flightdetail {

  private long fdId;
  private long flightId;
  private String fdDate;
  private long fdTickets;
  private double ratio;

  public long getFdId() {
    return fdId;
  }

  public void setFdId(long fdId) {
    this.fdId = fdId;
  }

  public long getflightId() {
    return flightId;
  }

  public void setflightId(long flightId) {
    this.flightId = flightId;
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
            ", flightId=" + flightId +
            ", fdDate='" + fdDate + '\'' +
            ", fdTickets=" + fdTickets +
            ", ratio=" + ratio +
            '}';
  }
}
