package com.lvbaba.service.impl;

import com.lvbaba.dao.AreaDao;
import com.lvbaba.entity.Area;
import com.lvbaba.service.AreaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author DBY
 * @date 2020/10/23 14:15
 */


@Service
public class AreaServiceImpl implements AreaService {
    @Resource
    private AreaDao areaDao;

    @Override
    public List<Area> queryCountry() {
        return areaDao.queryCountry();
    }

    @Override
    public List<Area> queryCityByCountry(Area area) {
        if (area==null){
        return null;
        }
        return areaDao.queryCityByCountry(area);
    }

    @Override
    public Area queryOne(Area area) {
        if(area==null){
            return null;
        }
        return areaDao.queryOne(area);
    }
}
