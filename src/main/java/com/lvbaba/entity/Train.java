package com.lvbaba.entity;

import java.util.List;

public class Train {

  private long trId;
  private String trNumber;
  private String trDTime;
  private long daId;
  private long arrAreaId;
  private long trCapacity;
  private double trPrice;
  private String trATime;
  private List<Traindetail> traindetailList;
  private Area d_area;
  private Area a_area;

  public Train(long trId, String trNumber, String trDTime, long daId, long arrAreaId, long trCapacity, double trPrice, String trATime, List<Traindetail> traindetailList, Area d_area, Area a_area) {
    this.trId = trId;
    this.trNumber = trNumber;
    this.trDTime = trDTime;
    this.daId = daId;
    this.arrAreaId = arrAreaId;
    this.trCapacity = trCapacity;
    this.trPrice = trPrice;
    this.trATime = trATime;
    this.traindetailList = traindetailList;
    this.d_area = d_area;
    this.a_area = a_area;
  }

  public Train() {
  }

  public Train(long trId) {
    this.trId = trId;
  }

  public long getTrId() {
    return trId;
  }

  public void setTrId(long trId) {
    this.trId = trId;
  }

  public String getTrNumber() {
    return trNumber;
  }

  public void setTrNumber(String trNumber) {
    this.trNumber = trNumber;
  }

  public String getTrDTime() {
    return trDTime;
  }

  public void setTrDTime(String trDTime) {
    this.trDTime = trDTime;
  }

  public long getdaId() {
    return daId;
  }

  public void setdaId(long daId) {
    this.daId = daId;
  }

  public long getarrAreaId() {
    return arrAreaId;
  }

  public void setarrAreaId(long arrAreaId) {
    this.arrAreaId = arrAreaId;
  }

  public long getTrCapacity() {
    return trCapacity;
  }

  public void setTrCapacity(long trCapacity) {
    this.trCapacity = trCapacity;
  }

  public double getTrPrice() {
    return trPrice;
  }

  public void setTrPrice(double trPrice) {
    this.trPrice = trPrice;
  }

  public String getTrATime() {
    return trATime;
  }

  public void setTrATime(String trATime) {
    this.trATime = trATime;
  }

  //  public long getTrId() {
//    return trId;
//  }
//
//  public void setTrId(long trId) {
//    this.trId = trId;
//  }
//
//
//  public String getTrNumber() {
//    return trNumber;
//  }
//
//  public void setTrNumber(String trNumber) {
//    this.trNumber = trNumber;
//  }
//
//
//  public String getTrDTime() {
//    return trDTime;
//  }
//
//  public void setTrDTime(String trDTime) {
//    this.trDTime = trDTime;
//  }
//
//
//  public long getDaId() {
//    return daId;
//  }
//
//  public void setDaId(long daId) {
//    this.daId = daId;
//  }
//
//
//  public long getarrAreaId() {
//    return arrAreaId;
//  }
//
//  public void setarrAreaId(long arrAreaId) {
//    this.arrAreaId = arrAreaId;
//  }
//
//
//  public long getTrCapacity() {
//    return trCapacity;
//  }
//
//  public void setTrCapacity(long trCapacity) {
//    this.trCapacity = trCapacity;
//  }
//
//
//  public double getTrPrice() {
//    return trPrice;
//  }
//
//  public void setTrPrice(double trPrice) {
//    this.trPrice = trPrice;
//  }
//
//
//  public String getTrATime() {
//    return trATime;
//  }
//
//  public void setTrATime(String trATime) {
//    this.trATime = trATime;
//  }
//
  public List<Traindetail> getTraindetailList() {
    return traindetailList;
  }

  public void setTraindetailList(List<Traindetail> traindetailList) {
    this.traindetailList = traindetailList;
  }

  public Area getD_area() {
    return d_area;
  }

  public void setD_area(Area d_area) {
    this.d_area = d_area;
  }

  public Area getA_area() {
    return a_area;
  }

  public void setA_area(Area a_area) {
    this.a_area = a_area;
  }

  @Override
  public String toString() {
    return "Train{" +
            "trId=" + trId +
            ", trNumber='" + trNumber + '\'' +
            ", trDTime='" + trDTime + '\'' +
            ", daId=" + daId +
            ", arrAreaId=" + arrAreaId +
            ", trCapacity=" + trCapacity +
            ", trPrice=" + trPrice +
            ", trATime='" + trATime + '\'' +
            ", traindetailList=" + traindetailList +
            ", d_area=" + d_area +
            ", a_area=" + a_area +
            '}';
  }
}
