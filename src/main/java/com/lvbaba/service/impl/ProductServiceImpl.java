package com.lvbaba.service.impl;

import com.lvbaba.dao.AreaDao;
import com.lvbaba.dao.HotelDao;
import com.lvbaba.dao.ProductDao;
import com.lvbaba.entity.Area;
import com.lvbaba.entity.Hotel;
import com.lvbaba.entity.Product;
import com.lvbaba.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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

    @Override
    public boolean insertProduct(Product product) {
        if (product==null){
            return false;
        }
        Product product1 = new Product();
        product1.setProductName(product.getProductName());
        Product product2 = productDao.query(product1);
        if (product2==null) {
            return productDao.insertProduct(product);
        }
        return false;
    }

    @Override
    public boolean removeProduct(Product product) {
        if (product==null){
            return false;
        }
        return productDao.removeProduct(product);
    }

    @Override
    public boolean updateProduct(Product product) {
        if (product==null){
            return false;
        }
        return productDao.updateProduct(product);
    }

    @Override
    public Product query(Product product) {
        if (product==null){
            return null;
        }
        return productDao.query(product);
    }

    @Override
    public List<Product> queryAll() {
        List<Product> products = productDao.queryAll();
        if (null!=products && products.size()>0){
            for (Product p:products) {
                p.setD_area(areaDao.queryOne(new Area(p.getDaId())));
                p.setA_area(areaDao.queryOne(new Area(p.getArrAreaId())));
                p.setHotel(hotelDao.queryOne(new Hotel(p.getHotelId())));
            }
        }
        return products;
    }

    @Override
    public List<Product> querByOthers(Product product) {
        if (product==null){
            return null;
        }
        List<Product> productList = productDao.queryByOthers(product);
        if (null!=productList && productList.size()>0){
            for (Product p:productList) {
                p.setD_area(areaDao.queryOne(new Area(p.getDaId())));
                p.setA_area(areaDao.queryOne(new Area(p.getArrAreaId())));
                p.setHotel(hotelDao.queryOne(new Hotel(p.getHotelId())));
            }
        }
        return productList;
    }

    @Override
    public List<Product> queryByAreaName(String deArea, String aimArea) {
        Area area =new Area();
        area.setCity(deArea);
        Area area1 =new Area();
        area1.setCity(aimArea);
        Area area2 = areaDao.queryOne(area);
        Area area3 = areaDao.queryOne(area1);
        Product product =new Product();
        product.setDaId(area2.getAreaId());
        product.setArrAreaId(area3.getAreaId());
        return productDao.queryByOthers(product);

    }
}
