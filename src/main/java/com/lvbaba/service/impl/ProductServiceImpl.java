package com.lvbaba.service.impl;

import com.lvbaba.dao.AreaDao;
import com.lvbaba.dao.FilesDao;
import com.lvbaba.dao.HotelDao;
import com.lvbaba.dao.ProductDao;
import com.lvbaba.entity.Area;
import com.lvbaba.entity.Files;
import com.lvbaba.entity.Hotel;
import com.lvbaba.entity.Product;
import com.lvbaba.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.io.File;

import java.util.ArrayList;

import java.util.List;

/**
 * Created by YY on 2020/10/20.
 */
@Service("productService")
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductDao productDao;
    @Resource
    private AreaDao areaDao;
    @Resource
    private HotelDao hotelDao;
    @Resource
    private FilesDao filesDao;

    @Override
    public boolean insertProduct(Product product, Files files) {
        if (product == null) {
            return false;
        }
        Product product1 = new Product();
        product1.setProductName(product.getProductName());
        Product product2 = productDao.query(product1);
        if (product2 != null) {
            return false;
        }
        boolean flag = productDao.insertProduct(product);
        if (flag != true) {
            return false;
        }
        Product product3 = productDao.query(product);
        files.setProductId(product3.getProductId());
        return filesDao.upLoadFile(files);
    }

    @Override
    public boolean removeProduct(Product product) {
        if (product == null) {
            return false;
        }
        return productDao.removeProduct(product);
    }

    @Override
    public boolean updateProduct(Product product, Files files) {
        if (product == null || files == null) {
            return false;
        }
        boolean flag1 = productDao.updateProduct(product);
        if (!flag1) {
            return false;
        }
        files.setProductId(product.getProductId());
        Files files1 = filesDao.queryByProductId(product.getProductId());
        if (files1 != null) {
            return filesDao.updateFilePath(files);
        } else {
            return filesDao.upLoadFile(files);
        }
    }

    @Override
    public Product query(Product product) {
        if (product == null) {
            return null;
        }
        Product product1 = productDao.query(product);
        Files files = filesDao.queryByProductId(product1.getProductId());
        product1.setFiles(files);
        return product1;
    }

    @Override
    public List<Product> queryAll() {
        List<Product> products = productDao.queryAll();
        if (null != products && products.size() > 0) {
            for (Product p : products) {
                p.setD_area(areaDao.queryOne(new Area(p.getDaId())));
                p.setA_area(areaDao.queryOne(new Area(p.getArrAreaId())));
                p.setHotel(hotelDao.queryOne(new Hotel(p.getHotelId())));
                p.setFiles(filesDao.queryByProductId(p.getProductId()));
            }
        }
        return products;
    }

    @Override
    public List<Product> querByOthers(Product product) {
        if (product == null) {
            return null;
        }
        List<Product> productList = productDao.queryByOthers(product);
        if (null != productList && productList.size() > 0) {
            for (Product p : productList) {
                p.setD_area(areaDao.queryOne(new Area(p.getDaId())));
                p.setA_area(areaDao.queryOne(new Area(p.getArrAreaId())));
                p.setHotel(hotelDao.queryOne(new Hotel(p.getHotelId())));
            }
        }
        return productList;
    }

    @Override

    public boolean upLoadFile(Files files) {
        return false;
    }

    @Override
    public Files queryByProductId(Long productId) {
        return filesDao.queryByProductId(productId);
    }

    @Override
    public boolean updateFilePath(Files files) {
        if (files == null) {
            return false;
        }

        return filesDao.updateFilePath(files);
    }

    @Override
    public List<Product> queryByAreaName(String deArea, String aimArea) {
        Area area = new Area();
        area.setCity(deArea);
        Area area1 = new Area();
        area1.setCity(aimArea);
        Area area2 = areaDao.queryOne(area);
        Area area3 = areaDao.queryOne(area1);
        Product product = new Product();
        product.setDaId(area2.getAreaId());
        product.setArrAreaId(area3.getAreaId());
        List<Product> productList = productDao.queryByOthers(product);
        List<Product> productList1 = new ArrayList<>();
        for (Product p : productList) {
            Hotel hotel1 = new Hotel();
            hotel1.setHotelId(p.getHotelId());
            Hotel hotel = hotelDao.queryOne(hotel1);
            p.setHotel(hotel);
            p.setFiles(filesDao.queryByProductId(p.getProductId()));
            productList1.add(p);
        }
        return productList1;

    }

    @Override
    public boolean updateProduct(Product product) {
        if(product==null){
            return false;
        }
        return productDao.updateProduct(product);
    }

}
