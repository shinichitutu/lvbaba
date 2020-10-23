package com.lvbaba.entity;


public class Hotel {

  private long hId;
  private long aId;
  private String hName;
  private long hLevel;

  public Hotel(long hId, long aId, String hName, long hLevel) {
    this.hId = hId;
    this.aId = aId;
    this.hName = hName;
    this.hLevel = hLevel;
  }

  public Hotel() {
  }

  public long gethId() {
    return hId;
  }

  public void sethId(long hId) {
    this.hId = hId;
  }

  public long getaId() {
    return aId;
  }

  public void setaId(long aId) {
    this.aId = aId;
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

  @Override
  public String toString() {
    return "Hotel{" +
            "hId=" + hId +
            ", aId=" + aId +
            ", hName='" + hName + '\'' +
            ", hLevel=" + hLevel +
            '}';
  }
}
