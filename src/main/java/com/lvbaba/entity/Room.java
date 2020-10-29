package com.lvbaba.entity;


public class Room {

  private long roomId;
  private long hotelId;
  private long roomNumber;
  private long personLimit;

  public Room(long hotelId, long roomNumber, long personLimit) {
    this.hotelId = hotelId;
    this.roomNumber = roomNumber;
    this.personLimit = personLimit;
  }

  public Room() {
  }

  public long getRoomId() {
    return roomId;
  }

  public void setRoomId(long roomId) {
    this.roomId = roomId;
  }

  public long getHotelId() {
    return hotelId;
  }

  public void setHotelId(long hotelId) {
    this.hotelId = hotelId;
  }

  public long getRoomNumber() {
    return roomNumber;
  }

  public void setRoomNumber(long roomNumber) {
    this.roomNumber = roomNumber;
  }

  public long getPersonLimit() {
    return personLimit;
  }

  public void setPersonLimit(long personLimit) {
    this.personLimit = personLimit;
  }
}
