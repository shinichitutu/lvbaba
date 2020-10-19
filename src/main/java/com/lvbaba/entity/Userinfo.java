package com.lvbaba.entity;


public class Userinfo {

  private long uiId;
  private long uId;
  private String person;
  private String idcard;
  private String phone;


  public long getUiId() {
    return uiId;
  }

  public void setUiId(long uiId) {
    this.uiId = uiId;
  }


  public long getUId() {
    return uId;
  }

  public void setUId(long uId) {
    this.uId = uId;
  }


  public String getPerson() {
    return person;
  }

  public void setPerson(String person) {
    this.person = person;
  }


  public String getIdcard() {
    return idcard;
  }

  public void setIdcard(String idcard) {
    this.idcard = idcard;
  }


  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  @Override
  public String toString() {
    return "Userinfo{" +
            "uiId=" + uiId +
            ", uId=" + uId +
            ", person='" + person + '\'' +
            ", idcard='" + idcard + '\'' +
            ", phone='" + phone + '\'' +
            '}';
  }
}
