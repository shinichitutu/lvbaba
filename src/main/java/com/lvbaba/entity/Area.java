package com.lvbaba.entity;


public class Area {

  private long aId;
  private String country;
  private String city;

  public Area(long aId, String country, String city) {
    this.aId = aId;
    this.country = country;
    this.city = city;
  }

  public Area() {
  }

  public Area(long aId) {
    this.aId = aId;
  }

  public long getaId() {
    return aId;
  }

  public void setaId(long aId) {
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
