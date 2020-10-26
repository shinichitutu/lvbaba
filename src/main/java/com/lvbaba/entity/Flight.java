package com.lvbaba.entity;


import java.util.ArrayList;
import java.util.List;

public class Flight {

    private long flightId;
    private String flightNumber;
    private String flightCompany;
    private String flightDTime;
    private String flightATime;
    private long deAId;
    private long aAreaId;
    private long fCapacity;
    private double fPrice;
    private List<Flightdetail> flightdetails = new ArrayList<>();

    public Flight() {
    }

    public Flight(long flightId, String fNumber, String fCompany, String fDTime, String fATime, long dAId, long aAreaId, long fCapacity, double fPrice, List<Flightdetail> flightdetails) {
        this.flightId = flightId;
        this.fNumber = fNumber;
        this.fCompany = fCompany;
        this.fDTime = fDTime;
        this.fATime = fATime;
        this.dAId = dAId;
        this.aAreaId = aAreaId;
        this.fCapacity = fCapacity;
        this.fPrice = fPrice;
        this.flightdetails = flightdetails;
    }

    public Flight(String fNumber, String fCompany, String fDTime, String fATime, long dAId, long aAreaId, long fCapacity, double fPrice, List<Flightdetail> flightdetails) {
        this.fNumber = fNumber;
        this.fCompany = fCompany;
        this.fDTime = fDTime;
        this.fATime = fATime;
        this.dAId = dAId;
        this.aAreaId = aAreaId;
        this.fCapacity = fCapacity;
        this.fPrice = fPrice;
        this.flightdetails = flightdetails;
    }

    public long getflightId() {
        return flightId;
    }

    public void setflightId(long flightId) {
        this.flightId = flightId;
    }

    public String getfNumber() {
        return fNumber;
    }

    public void setfNumber(String fNumber) {
        this.fNumber = fNumber;
    }

    public String getfCompany() {
        return fCompany;
    }

    public void setfCompany(String fCompany) {
        this.fCompany = fCompany;
    }

    public String getfDTime() {
        return fDTime;
    }

    public void setfDTime(String fDTime) {
        this.fDTime = fDTime;
    }

    public String getfATime() {
        return fATime;
    }

    public void setfATime(String fATime) {
        this.fATime = fATime;
    }

    public long getdAId() {
        return dAId;
    }

    public void setdAId(long dAId) {
        this.dAId = dAId;
    }

    public long getaAreaId() {
        return aAreaId;
    }

    public void setaAreaId(long aAreaId) {
        this.aAreaId = aAreaId;
    }

    public long getfCapacity() {
        return fCapacity;
    }

    public void setfCapacity(long fCapacity) {
        this.fCapacity = fCapacity;
    }

    public double getfPrice() {
        return fPrice;
    }

    public void setfPrice(double fPrice) {
        this.fPrice = fPrice;
    }

    public List<Flightdetail> getFlightdetails() {
        return flightdetails;
    }

    public void setFlightdetails(List<Flightdetail> flightdetails) {
        this.flightdetails = flightdetails;
    }

    @Override
    public String toString() {
        return "Flight{" +
                "flightId=" + flightId +
                ", fNumber='" + fNumber + '\'' +
                ", fCompany='" + fCompany + '\'' +
                ", fDTime='" + fDTime + '\'' +
                ", fATime='" + fATime + '\'' +
                ", dAId=" + dAId +
                ", aAreaId=" + aAreaId +
                ", fCapacity=" + fCapacity +
                ", fPrice=" + fPrice +
                '}';
    }
}
