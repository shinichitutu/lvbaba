package com.lvbaba.entity;

public class User {

  private long uId;
  private String uName;
  private String uUsername;
  private String uPassword;
  private long uLevel;
  private double balance;


  public long getUId() {
    return uId;
  }

  public void setUId(long uId) {
    this.uId = uId;
  }


  public String getUName() {
    return uName;
  }

  public void setUName(String uName) {
    this.uName = uName;
  }


  public String getUUsername() {
    return uUsername;
  }

  public void setUUsername(String uUsername) {
    this.uUsername = uUsername;
  }


  public String getUPassword() {
    return uPassword;
  }

  public void setUPassword(String uPassword) {
    this.uPassword = uPassword;
  }


  public long getULevel() {
    return uLevel;
  }

  public void setULevel(long uLevel) {
    this.uLevel = uLevel;
  }


  public double getBalance() {
    return balance;
  }

  public void setBalance(double balance) {
    this.balance = balance;
  }

}
