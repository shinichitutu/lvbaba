package com.lvbaba.entity;


import java.util.List;

public class Roomdetail {

  private long rdId;
  private long rId;
  private String rDate;
  private double rdPrice;
  private long rdNumber;
  private Room room;

  public Roomdetail(long rdId, long rId, String rDate, double rdPrice, long rdNumber, Room room) {
    this.rdId = rdId;
    this.rId = rId;
    this.rDate = rDate;
    this.rdPrice = rdPrice;
    this.rdNumber = rdNumber;
    this.room = room;
  }

  public Roomdetail() {
  }

  public Roomdetail(long rId, String rDate, double rdPrice, long rdNumber, Room room) {
    this.rId = rId;
    this.rDate = rDate;
    this.rdPrice = rdPrice;
    this.rdNumber = rdNumber;
    this.room = room;
  }

  public long getRdId() {
    return rdId;
  }

  public void setRdId(long rdId) {
    this.rdId = rdId;
  }

  public long getrId() {
    return rId;
  }

  public void setrId(long rId) {
    this.rId = rId;
  }

  public String getrDate() {
    return rDate;
  }

  public void setrDate(String rDate) {
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

  public Room getRoom() {
    return room;
  }

  public void setRoom(Room room) {
    this.room = room;
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
