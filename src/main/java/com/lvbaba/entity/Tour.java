package com.lvbaba.entity;

public class Tour {

  private long tId;
  private long pId;
  private String dDate;
  private String rDate;
  private String cType;
  private long goId;
  private long returnId;
  private long bookNum;
  private String tStatus;


  public long getTId() {
    return tId;
  }

  public void setTId(long tId) {
    this.tId = tId;
  }


  public long getPId() {
    return pId;
  }

  public void setPId(long pId) {
    this.pId = pId;
  }


  public String getDDate() {
    return dDate;
  }

  public void setDDate(String dDate) {
    this.dDate = dDate;
  }


  public String getRDate() {
    return rDate;
  }

  public void setRDate(String rDate) {
    this.rDate = rDate;
  }


  public String getCType() {
    return cType;
  }

  public void setCType(String cType) {
    this.cType = cType;
  }


  public long getGoId() {
    return goId;
  }

  public void setGoId(long goId) {
    this.goId = goId;
  }


  public long getReturnId() {
    return returnId;
  }

  public void setReturnId(long returnId) {
    this.returnId = returnId;
  }


  public long getBookNum() {
    return bookNum;
  }

  public void setBookNum(long bookNum) {
    this.bookNum = bookNum;
  }


  public String getTStatus() {
    return tStatus;
  }

  public void setTStatus(String tStatus) {
    this.tStatus = tStatus;
  }

}
