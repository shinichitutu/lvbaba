package com.lvbaba.entity;


import java.util.List;

public class Roomdetail {

  private long rdId;
  private long roomId;
  private String roomDate;
  private double rdPrice;
  private long rdNumber;
  private Room room;

  public Roomdetail(long rdId, long roomId, String roomDate, double rdPrice, long rdNumber, Room room) {
    this.rdId = rdId;
    this.roomId = roomId;
    this.roomDate = roomDate;
    this.rdPrice = rdPrice;
    this.rdNumber = rdNumber;
    this.room = room;
  }

  public Roomdetail(long roomId, String roomDate, double rdPrice, long rdNumber, Room room) {
    this.roomId = roomId;
    this.roomDate = roomDate;
    this.rdPrice = rdPrice;
    this.rdNumber = rdNumber;
    this.room = room;
  }

  public Roomdetail() {
  }

  public Roomdetail(long roomId, String roomDate, double rdPrice) {
    this.roomId = roomId;
    this.roomDate = roomDate;
    this.rdPrice = rdPrice;
  }

  public Roomdetail(long roomId, String roomDate, double rdPrice, long rdNumber) {
    this.roomId = roomId;
    this.roomDate = roomDate;
    this.rdPrice = rdPrice;
    this.rdNumber = rdNumber;
  }

  public long getRdId() {
    return rdId;
  }

  public void setRdId(long rdId) {
    this.rdId = rdId;
  }

  public long getRoomId() {
    return roomId;
  }

  public void setRoomId(long roomId) {
    this.roomId = roomId;
  }

  public String getRoomDate() {
    return roomDate;
  }

  public void setRoomDate(String roomDate) {
    this.roomDate = roomDate;
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
}
