package com.lvbaba.entity;


public class Area {

  private long aId;
  private String country;
  private String city;

  public Area(long aId) {
    this.aId = aId;
  }

  public Area() {
  }

  public long getAId() {
    return aId;
  }

  public void setAId(long aId) {
    this.aId = aId;
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

  @Override
  public String toString() {
    return "Area{" +
            "aId=" + aId +
            ", country='" + country + '\'' +
            ", city='" + city + '\'' +
            '}';
  }
}
