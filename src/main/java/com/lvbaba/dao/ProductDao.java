package com.lvbaba.dao;

import com.lvbaba.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by YY on 2020/10/20.
 */
@Repository
public interface ProductDao {
    /**
     * 插入产品表
     * @param product
     * @return
     */
    boolean insertProduct(Product product);

    /**
     * 删除产品表
     * @param product
     * @return
     */
    boolean removeProduct(Product product);

    /**
     * 修改产品表
     * @param product
     * @return
     */
    boolean updateProduct(Product product);

    /**
     * 根据产品id查询商品
     * @param product
     * @return
     */
    Product query(Product product);

    /**
     * 查询所有产品
     * @param
     * @return
     */
    List<Product> queryAll();
}
