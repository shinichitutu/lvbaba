package com.lvbaba.entity;


public class Hotel {

  private long hotelId;
  private long areaId;
  private String hotelName;
  private long hotelLevel;
  private Area area;


  public Hotel(long hotelId, long areaId, String hotelName, long hotelLevel, Area area) {
    this.hotelId = hotelId;
    this.areaId = areaId;
    this.hotelName = hotelName;
    this.hotelLevel = hotelLevel;
    this.area = area;
  }

  public Hotel() {
  }

  public Hotel(long areaId, String hotelName, long hotelLevel) {
    this.areaId = areaId;
    this.hotelName = hotelName;
    this.hotelLevel = hotelLevel;
  }

  public Hotel(long hotelId, long areaId, String hotelName, long hotelLevel) {
    this.hotelId = hotelId;
    this.areaId = areaId;
    this.hotelName = hotelName;
    this.hotelLevel = hotelLevel;
  }

  public long getHotelId() {
    return hotelId;
  }

  public void setHotelId(long hotelId) {
    this.hotelId = hotelId;
  }

  public long getAreaId() {
    return areaId;
  }

  public void setAreaId(long areaId) {
    this.areaId = areaId;
  }

  public String getHotelName() {
    return hotelName;
  }

  public void setHotelName(String hotelName) {
    this.hotelName = hotelName;
  }

  public long getHotelLevel() {
    return hotelLevel;
  }

  public void setHotelLevel(long hotelLevel) {
    this.hotelLevel = hotelLevel;
  }

  public Area getArea() {
    return area;
  }

  public void setArea(Area area) {
    this.area = area;
  }

  @Override
  public String toString() {
    return "Hotel{" +
            "hotelId=" + hotelId +
            ", areaId=" + areaId +
            ", hotelName='" + hotelName + '\'' +
            ", hotelLevel=" + hotelLevel +
            ", area=" + area +
            '}';
  }
}
