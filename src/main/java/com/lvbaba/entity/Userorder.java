package com.lvbaba.entity;


public class Userorder {

  private long orderId;
  private long uId;
  private long tourId;
  private double orderPrice;
  private String orderStatus;
  private String orderTime;
  private String payTime;

  public long getOrderId() {
    return orderId;
  }

  public void setOrderId(long orderId) {
    this.orderId = orderId;
  }

  public long getuId() {
    return uId;
  }

  public void setuId(long uId) {
    this.uId = uId;
  }

  public long getTourId() {
    return tourId;
  }

  public void setTourId(long tourId) {
    this.tourId = tourId;
  }

  public double getOrderPrice() {
    return orderPrice;
  }

  public void setOrderPrice(double orderPrice) {
    this.orderPrice = orderPrice;
  }

  public String getOrderStatus() {
    return orderStatus;
  }

  public void setOrderStatus(String orderStatus) {
    this.orderStatus = orderStatus;
  }

  public String getOrderTime() {
    return orderTime;
  }

  public void setOrderTime(String orderTime) {
    this.orderTime = orderTime;
  }

  public String getPayTime() {
    return payTime;
  }

  public void setPayTime(String payTime) {
    this.payTime = payTime;
  }

  @Override
  public String toString() {
    return "Userorder{" +
            "orderId=" + orderId +
            ", uId=" + uId +
            ", tourId=" + tourId +
            ", orderPrice=" + orderPrice +
            ", orderStatus='" + orderStatus + '\'' +
            ", orderTime='" + orderTime + '\'' +
            ", payTime='" + payTime + '\'' +
            '}';
  }
}
