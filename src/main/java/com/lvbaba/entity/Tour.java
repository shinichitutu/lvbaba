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


  public long gettId() {
    return tId;
  }

  public void settId(long tId) {
    this.tId = tId;
  }

  public long getpId() {
    return pId;
  }

  public void setpId(long pId) {
    this.pId = pId;
  }

  public String getdDate() {
    return dDate;
  }

  public void setdDate(String dDate) {
    this.dDate = dDate;
  }

  public String getrDate() {
    return rDate;
  }

  public void setrDate(String rDate) {
    this.rDate = rDate;
  }

  public String getcType() {
    return cType;
  }

  public void setcType(String cType) {
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

  public String gettStatus() {
    return tStatus;
  }

  public void settStatus(String tStatus) {
    this.tStatus = tStatus;
  }

  @Override
  public String toString() {
    return "Tour{" +
            "tId=" + tId +
            ", pId=" + pId +
            ", dDate='" + dDate + '\'' +
            ", rDate='" + rDate + '\'' +
            ", cType='" + cType + '\'' +
            ", goId=" + goId +
            ", returnId=" + returnId +
            ", bookNum=" + bookNum +
            ", tStatus='" + tStatus + '\'' +
            '}';
  }
}
