package com.lvbaba.service;

import com.lvbaba.entity.Files;
import com.lvbaba.entity.Product;

import java.util.List;

/**
 * Created by YY on 2020/10/20.
 */
public interface ProductService {
    /**
     * 插入产品表
     * @param product
     * @return
     */
    boolean insertProduct(Product product,Files files);

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
    boolean updateProduct(Product product,Files files);

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

    List<Product> querByOthers(Product product);

    /**
     * 上传文件的方法
     * @param files
     * @return
     */
    boolean upLoadFile(Files files);

    /**
     * 通过产品Id返回该产品的路径
     * @param productId
     * @return
     */
    Files queryByProductId(Long productId);

    /**
     * 通过产品Id修改当前产品的路径
     * @param files
     * @return
     */
    boolean updateFilePath(Files files);

}
