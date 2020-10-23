package com.lvbaba.entity;


public class Traindetail {

  private long tdId;
  private long trId;
  private String tdDate;
  private long tdTickets;

  public long getTdId() {
    return tdId;
  }

  public void setTdId(long tdId) {
    this.tdId = tdId;
  }

  public long getTrId() {
    return trId;
  }

  public void setTrId(long trId) {
    this.trId = trId;
  }

  public String getTdDate() {
    return tdDate;
  }

  public void setTdDate(String tdDate) {
    this.tdDate = tdDate;
  }

  public long getTdTickets() {
    return tdTickets;
  }

  public void setTdTickets(long tdTickets) {
    this.tdTickets = tdTickets;
  }

  @Override
  public String toString() {
    return "Traindetail{" +
            "tdId=" + tdId +
            ", trId=" + trId +
            ", tdDate='" + tdDate + '\'' +
            ", tdTickets=" + tdTickets +
            '}';
  }
}
