package com.lvbaba.service.impl;

import com.lvbaba.dao.ProductDao;
import com.lvbaba.entity.Product;
import com.lvbaba.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YY on 2020/10/20.
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductDao productDao;

    @Override
    public boolean insertProduct(Product product) {
        return productDao.insertProduct(product);
    }

    @Override
    public boolean removeProduct(Product product) {
        return productDao.removeProduct(product);
    }

    @Override
    public boolean updateProduct(Product product) {
        return productDao.updateProduct(product);
    }

    @Override
    public Product query(Product product) {
        return productDao.query(product);
    }

    @Override
    public List<Product> queryAll() {
        return productDao.queryAll();
    }
}
