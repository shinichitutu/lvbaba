package com.lvbaba.entity;


public class Roomdetail {

  private long rdId;
  private long rId;
  private String rDate;
  private double rdPrice;
  private long rdNumber;


  public long getRdId() {
    return rdId;
  }

  public void setRdId(long rdId) {
    this.rdId = rdId;
  }


  public long getRId() {
    return rId;
  }

  public void setRId(long rId) {
    this.rId = rId;
  }


  public String getRDate() {
    return rDate;
  }

  public void setRDate(String rDate) {
    this.rDate = rDate;
  }


  public double getRdPrice() {
    return rdPrice;
  }

  public void setRdPrice(double rdPrice) {
    this.rdPrice = rdPrice;
  }


  public long getRdNumber() {
    return rdNumber;
  }

  public void setRdNumber(long rdNumber) {
    this.rdNumber = rdNumber;
  }

  @Override
  public String toString() {
    return "Roomdetail{" +
            "rdId=" + rdId +
            ", rId=" + rId +
            ", rDate='" + rDate + '\'' +
            ", rdPrice=" + rdPrice +
            ", rdNumber=" + rdNumber +
            '}';
  }
}
