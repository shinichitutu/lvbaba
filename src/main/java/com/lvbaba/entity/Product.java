package com.lvbaba.entity;


public class Product {

  private long productId;
  private long daId;
  private long arrAreaId;
  private long limLow;
  private long limUp;
  private long days;
  private long hotelId;
  private String productName;
  private String productFee;
  private double productScore;
  private String productIntroduction;
  private Area d_area;
  private Area a_area;
  private Hotel hotel;
  private Files files;

  public String getProductIntroduction() {
    return productIntroduction;
  }

  public void setProductIntroduction(String productIntroduction) {
    this.productIntroduction = productIntroduction;
  }

  public Product(long productId, long daId, long arrAreaId, long limLow, long limUp, long days, long hotelId, String productName, String productFee, double productScore) {
    this.productId = productId;
    this.daId = daId;
    this.arrAreaId = arrAreaId;
    this.limLow = limLow;
    this.limUp = limUp;
    this.days = days;
    this.hotelId = hotelId;
    this.productName = productName;
    this.productFee = productFee;
    this.productScore = productScore;
  }

  public Product(long daId, long arrAreaId, long limLow, long limUp, long days, long hotelId, String productName, String productFee, double productScore, String productIntroduction) {
    this.daId = daId;
    this.arrAreaId = arrAreaId;
    this.limLow = limLow;
    this.limUp = limUp;
    this.days = days;
    this.hotelId = hotelId;
    this.productName = productName;
    this.productFee = productFee;
    this.productScore = productScore;
    this.productIntroduction = productIntroduction;
  }

  public Product() {
  }

  public Product(long productId) {
    this.productId = productId;
  }

  public long getProductId() {
    return productId;
  }

  public void setProductId(long productId) {
    this.productId = productId;
  }

  public long getDaId() {
    return daId;
  }

  public void setDaId(long daId) {
    this.daId = daId;
  }

  public long getArrAreaId() {
    return arrAreaId;
  }

  public void setArrAreaId(long arrAreaId) {
    this.arrAreaId = arrAreaId;
  }

  public long getLimLow() {
    return limLow;
  }

  public void setLimLow(long limLow) {
    this.limLow = limLow;
  }

  public long getLimUp() {
    return limUp;
  }

  public void setLimUp(long limUp) {
    this.limUp = limUp;
  }

  public long getDays() {
    return days;
  }

  public void setDays(long days) {
    this.days = days;
  }

  public long getHotelId() {
    return hotelId;
  }

  public void setHotelId(long hotelId) {
    this.hotelId = hotelId;
  }

  public String getProductName() {
    return productName;
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }

  public String getProductFee() {
    return productFee;
  }

  public void setProductFee(String productFee) {
    this.productFee = productFee;
  }

  public double getProductScore() {
    return productScore;
  }

  public void setProductScore(double productScore) {
    this.productScore = productScore;
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

  public Hotel getHotel() {
    return hotel;
  }

  public void setHotel(Hotel hotel) {
    this.hotel = hotel;
  }

  public Files getFiles() {
    return files;
  }

  public void setFiles(Files files) {
    this.files = files;
  }

  @Override
  public String toString() {
    return "Product{" +
            "productId=" + productId +
            ", daId=" + daId +
            ", arrAreaId=" + arrAreaId +
            ", limLow=" + limLow +
            ", limUp=" + limUp +
            ", days=" + days +
            ", hotelId=" + hotelId +
            ", productName='" + productName + '\'' +
            ", productFee='" + productFee + '\'' +
            ", productScore=" + productScore +
            ", productIntroduction='" + productIntroduction + '\'' +
            '}';
  }
}
