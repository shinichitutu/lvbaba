package com.lvbaba.entity;

public class User {

  private long uId;
  private String uName;
  private String uUsername;
  private String uPassword;
  private long uLevel;
  private double balance;

  public User() {
  }

  public User(long uId) {
    this.uId = uId;
  }

  public long getuId() {
    return uId;
  }

  public void setuId(long uId) {
    this.uId = uId;
  }

  public String getuName() {
    return uName;
  }

  public void setuName(String uName) {
    this.uName = uName;
  }

  public String getuUsername() {
    return uUsername;
  }

  public void setuUsername(String uUsername) {
    this.uUsername = uUsername;
  }

  public String getuPassword() {
    return uPassword;
  }

  public void setuPassword(String uPassword) {
    this.uPassword = uPassword;
  }

  public long getuLevel() {
    return uLevel;
  }

  public void setuLevel(long uLevel) {
    this.uLevel = uLevel;
  }

  public double getBalance() {
    return balance;
  }

  public void setBalance(double balance) {
    this.balance = balance;
  }

  @Override
  public String toString() {
    return "User{" +
            "uId=" + uId +
            ", uName='" + uName + '\'' +
            ", uUsername='" + uUsername + '\'' +
            ", uPassword='" + uPassword + '\'' +
            ", uLevel=" + uLevel +
            ", balance=" + balance +
            '}';
  }
}
