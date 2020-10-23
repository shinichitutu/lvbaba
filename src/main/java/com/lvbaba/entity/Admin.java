package com.lvbaba.entity;


public class Admin {

  private long adId;
  private String adName;
  private String adPassword;



  public long getAdId() {
    return adId;
  }

  public void setAdId(long adId) {
    this.adId = adId;
  }


  public String getAdName() {
    return adName;
  }

  public void setAdName(String adName) {
    this.adName = adName;
  }


  public String getAdPassword() {
    return adPassword;
  }

  public void setAdPassword(String adPassword) {
    this.adPassword = adPassword;
  }

  @Override
  public String toString() {
    return "Admin{" +
            "adId=" + adId +
            ", adName='" + adName + '\'' +
            ", adPassword='" + adPassword + '\'' +
            '}';
  }
}
