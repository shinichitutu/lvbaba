package com.lvbaba.entity;


public class Userorder {

  private long orderId;
  private long uId;
  private long tourId;
  private double orderPrice;
  private String orderStatus;
  private String orderTime;
  private String payTime;

  privite Tour tour;
  private Product product;
  private long roomId;
  private long roomNum;
  private long person;


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



  public Tour getTour() {
    return tour;
  }

  public void setTour(Tour tour) {
    this.tour = tour;
  }

  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;


  public long getRoomNum() {
    return roomNum;
  }

  public void setRoomNum(long roomNum) {
    this.roomNum = roomNum;
  }

  public long getPerson() {
    return person;
  }

  public void setPerson(long person) {
    this.person = person;
  }

  public long getRoomId() {
    return roomId;
  }

  public void setRoomId(long roomId) {
    this.roomId = roomId;

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
            ", roomId=" + roomId +
            ", tour=" + tour +
            ", product=" + product +
            ", roomNum=" + roomNum +
            ", person=" + person +

            '}';
  }
}
