package com.lvbaba.dao;

import com.lvbaba.entity.Files;
import org.springframework.stereotype.Repository;

@Repository
public interface FilesDao {
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
