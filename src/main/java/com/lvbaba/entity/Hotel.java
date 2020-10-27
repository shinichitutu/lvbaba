package com.lvbaba.entity;


public class Hotel {

  private long hId;
  private long areaId;
  private String hName;
  private long hLevel;
  private Area area;


  public Hotel(long hId, long areaId, String hName, long hLevel) {
    this.hId = hId;
    this.areaId = areaId;
    this.hName = hName;
    this.hLevel = hLevel;
  }

  public Hotel() {
  }

  public Hotel(long hId) {
    this.hId = hId;
  }

  public Hotel(long areaId, String hName, long hLevel) {
    this.areaId = areaId;
    this.hName = hName;
    this.hLevel = hLevel;
  }

  public long gethId() {
    return hId;
  }

  public void sethId(long hId) {
    this.hId = hId;
  }

  public long getAreaId() {
    return areaId;
  }

  public void setAreaId(long areaId) {
    this.areaId = areaId;
  }

  public String gethName() {
    return hName;
  }

  public void sethName(String hName) {
    this.hName = hName;
  }

  public long gethLevel() {
    return hLevel;
  }

  public void sethLevel(long hLevel) {
    this.hLevel = hLevel;
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
            "hId=" + hId +
            ", areaId=" + areaId +
            ", hName='" + hName + '\'' +
            ", hLevel=" + hLevel +
            ", area=" + area +
            '}';
  }
}
