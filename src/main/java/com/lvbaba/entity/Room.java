package com.lvbaba.entity;


public class Room {

  private long rId;
  private long hId;
  private long rNumber;
  private long pLimit;


  public long getRId() {
    return rId;
  }

  public void setRId(long rId) {
    this.rId = rId;
  }


  public long getHId() {
    return hId;
  }

  public void setHId(long hId) {
    this.hId = hId;
  }


  public long getRNumber() {
    return rNumber;
  }

  public void setRNumber(long rNumber) {
    this.rNumber = rNumber;
  }


  public long getPLimit() {
    return pLimit;
  }

  public void setPLimit(long pLimit) {
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
