package com.lvbaba.entity;

/**
 * Created by YY on 2020/11/3.
 */
public class HotelOrder {
    private Integer hoId;//序号
    private Integer userId;//用户id
    private Integer roomId;//客房id
    private String inDate;//入住日期
    private String outDate;//离店日期
    private Integer hotelBookingDate;//预定日期
    private Integer roomNum;//预订房间数量
    private double hoPrice;//订单价格

    public HotelOrder(Integer hoId, Integer userId, Integer roomId, String inDate, String outDate, Integer hotelBookingDate, Integer roomNum, double hoPrice) {
        this.hoId = hoId;
        this.userId = userId;
        this.roomId = roomId;
        this.inDate = inDate;
        this.outDate = outDate;
        this.hotelBookingDate = hotelBookingDate;
        this.roomNum = roomNum;
        this.hoPrice = hoPrice;
    }

    public HotelOrder() {
    }

    @Override
    public String toString() {
        return "HotelOrder{" +
                "hoId=" + hoId +
                ", userId=" + userId +
                ", roomId=" + roomId +
                ", inDate='" + inDate + '\'' +
                ", outDate='" + outDate + '\'' +
                ", hotelBookingDate=" + hotelBookingDate +
                ", roomNum=" + roomNum +
                ", hoPrice=" + hoPrice +
                '}';
    }

    public Integer getHoId() {
        return hoId;
    }

    public void setHoId(Integer hoId) {
        this.hoId = hoId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public String getInDate() {
        return inDate;
    }

    public void setInDate(String inDate) {
        this.inDate = inDate;
    }

    public String getOutDate() {
        return outDate;
    }

    public void setOutDate(String outDate) {
        this.outDate = outDate;
    }

    public Integer getHotelBookingDate() {
        return hotelBookingDate;
    }

    public void setHotelBookingDate(Integer hotelBookingDate) {
        this.hotelBookingDate = hotelBookingDate;
    }

    public Integer getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(Integer roomNum) {
        this.roomNum = roomNum;
    }

    public double getHoPrice() {
        return hoPrice;
    }

    public void setHoPrice(double hoPrice) {
        this.hoPrice = hoPrice;
    }
}
