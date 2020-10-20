package com.lvbaba.entity;


import java.util.ArrayList;
import java.util.List;

public class Flight {

    private long fId;
    private String fNumber;
    private String fCompany;
    private String fDTime;
    private String fATime;
    private long dAId;
    private long aAreaId;
    private long fCapacity;
    private double fPrice;
    private List<Flightdetail> flightdetails = new ArrayList<>();

    public Flight() {
    }

    public Flight(long fId, String fNumber, String fCompany, String fDTime, String fATime, long dAId, long aAreaId, long fCapacity, double fPrice, List<Flightdetail> flightdetails) {
        this.fId = fId;
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

    public List<Flightdetail> getFlightdetails() {
        return flightdetails;
    }

    public void setFlightdetails(List<Flightdetail> flightdetails) {
        this.flightdetails = flightdetails;
    }

    public long getFId() {
        return fId;
    }

    public void setFId(long fId) {
        this.fId = fId;
    }


    public String getFNumber() {
        return fNumber;
    }

    public void setFNumber(String fNumber) {
        this.fNumber = fNumber;
    }


    public String getFCompany() {
        return fCompany;
    }

    public void setFCompany(String fCompany) {
        this.fCompany = fCompany;
    }


    public String getFDTime() {
        return fDTime;
    }

    public void setFDTime(String fDTime) {
        this.fDTime = fDTime;
    }


    public String getFATime() {
        return fATime;
    }

    public void setFATime(String fATime) {
        this.fATime = fATime;
    }


    public long getDAId() {
        return dAId;
    }

    public void setDAId(long dAId) {
        this.dAId = dAId;
    }


    public long getAAreaId() {
        return aAreaId;
    }

    public void setAAreaId(long aAreaId) {
        this.aAreaId = aAreaId;
    }


    public long getFCapacity() {
        return fCapacity;
    }

    public void setFCapacity(long fCapacity) {
        this.fCapacity = fCapacity;
    }


    public double getFPrice() {
        return fPrice;
    }

    public void setFPrice(double fPrice) {
        this.fPrice = fPrice;
    }

    @Override
    public String toString() {
        return "Flight{" +
                "fId=" + fId +
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
