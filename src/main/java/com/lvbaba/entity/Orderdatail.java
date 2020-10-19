package com.lvbaba.entity;


public class Orderdatail {

  private long odId;
  private long oId;
  private String odPerson;
  private String odIdcard;
  private String odPhone;


  public long getOdId() {
    return odId;
  }

  public void setOdId(long odId) {
    this.odId = odId;
  }


  public long getOId() {
    return oId;
  }

  public void setOId(long oId) {
    this.oId = oId;
  }


  public String getOdPerson() {
    return odPerson;
  }

  public void setOdPerson(String odPerson) {
    this.odPerson = odPerson;
  }


  public String getOdIdcard() {
    return odIdcard;
  }

  public void setOdIdcard(String odIdcard) {
    this.odIdcard = odIdcard;
  }


  public String getOdPhone() {
    return odPhone;
  }

  public void setOdPhone(String odPhone) {
    this.odPhone = odPhone;
  }

  @Override
  public String toString() {
    return "Orderdatail{" +
            "odId=" + odId +
            ", oId=" + oId +
            ", odPerson='" + odPerson + '\'' +
            ", odIdcard='" + odIdcard + '\'' +
            ", odPhone='" + odPhone + '\'' +
            '}';
  }
}
