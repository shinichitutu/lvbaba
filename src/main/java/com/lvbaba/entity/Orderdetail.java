package com.lvbaba.entity;


public class Orderdetail {

  private long odId;
  private long orderId;
  private String odPerson;
  private String odIdcard;
  private String odPhone;

  public Orderdetail(long orderId, String odPerson, String odIdcard, String odPhone) {
    this.orderId = orderId;
    this.odPerson = odPerson;
    this.odIdcard = odIdcard;
    this.odPhone = odPhone;
  }

  public Orderdetail() {
  }

  public long getOdId() {
    return odId;
  }

  public long getOrderId() {
    return orderId;
  }

  public String getOdPerson() {
    return odPerson;
  }

  public String getOdIdcard() {
    return odIdcard;
  }

  public String getOdPhone() {
    return odPhone;
  }

  public void setOdId(long odId) {
    this.odId = odId;
  }

  public void setOrderId(long orderId) {
    this.orderId = orderId;
  }

  public void setOdPerson(String odPerson) {
    this.odPerson = odPerson;
  }

  public void setOdIdcard(String odIdcard) {
    this.odIdcard = odIdcard;
  }

  public void setOdPhone(String odPhone) {
    this.odPhone = odPhone;
  }

  @Override
  public String toString() {
    return "Orderdetail{" +
            "odId=" + odId +
            ", orderId=" + orderId +
            ", odPerson='" + odPerson + '\'' +
            ", odIdcard='" + odIdcard + '\'' +
            ", odPhone='" + odPhone + '\'' +
            '}';
  }
}
