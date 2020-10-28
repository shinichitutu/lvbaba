package com.lvbaba.entityUtil;

import com.lvbaba.entity.Area;
import com.lvbaba.entity.Hotel;
import com.lvbaba.entity.Product;

/**
 * Created by YY on 2020/10/28.
 */
public class ProductArea {
    private Product product;
    private String departArea;
    private String destinationArea;
    private Hotel hotel;
    public ProductArea(Product product, String departArea, String destinationArea) {
        this.product = product;
        this.departArea = departArea;
        this.destinationArea = destinationArea;
    }

    public ProductArea(Product product, String departArea, String destinationArea, Hotel hotel) {
        this.product = product;
        this.departArea = departArea;
        this.destinationArea = destinationArea;
        this.hotel = hotel;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public ProductArea() {
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getDepartArea() {
        return departArea;
    }

    public void setDepartArea(String departArea) {
        this.departArea = departArea;
    }

    public String getDestinationArea() {
        return destinationArea;
    }

    public void setDestinationArea(String destinationArea) {
        this.destinationArea = destinationArea;
    }

    @Override
    public String toString() {
        return "ProductArea{" +
                "product=" + product +
                ", departArea='" + departArea + '\'' +
                ", destinationArea='" + destinationArea + '\'' +
                ", hotel=" + hotel +
                '}';
    }
}
