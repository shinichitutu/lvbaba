package com.lvbaba.entity;


public class Room {

  private long rId;
  private long hId;
  private long rNumber;
  private long pLimit;


  public long getrId() {
    return rId;
  }

  public void setrId(long rId) {
    this.rId = rId;
  }

  public long gethId() {
    return hId;
  }

  public void sethId(long hId) {
    this.hId = hId;
  }

  public long getrNumber() {
    return rNumber;
  }

  public void setrNumber(long rNumber) {
    this.rNumber = rNumber;
  }

  public long getpLimit() {
    return pLimit;
  }

  public void setpLimit(long pLimit) {
    this.pLimit = pLimit;
  }

  @Override
  public String toString() {
    return "Room{" +
            "rId=" + rId +
            ", hId=" + hId +
            ", rNumber=" + rNumber +
            ", pLimit=" + pLimit +
            '}';
  }
}
