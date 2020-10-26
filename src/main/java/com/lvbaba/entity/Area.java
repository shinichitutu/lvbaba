package com.lvbaba.entity;


public class Area {

  private long areaId;
  private String country;
  private String city;

  public Area(long areaId) {
    this.areaId = areaId;
  }

  public Area() {
  }

  public long getAreaId() {
    return areaId;
  }

  public void setAreaId(long areaId) {
    this.areaId = areaId;
  }

  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }
}
