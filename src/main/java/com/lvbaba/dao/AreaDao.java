package com.lvbaba.dao;

import com.lvbaba.entity.Area;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AreaDao {
    /**
     * 查询所有国家
     * @return
     */
    List<Area> queryCountry();

    /**
     * 通过国家查询下属的所有城市
     * @param area
     * @return
     */
    List<Area> queryCityByCountry(Area area);

    /**
     * 通过地址Id返回对应的地址
     * @param area
     * @return
     */
    Area queryOne(Area area);

}
