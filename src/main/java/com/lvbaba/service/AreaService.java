package com.lvbaba.service;

import com.lvbaba.entity.Area;

import java.util.List;

public interface AreaService {

    List<Area> queryCountry();
    List<Area> queryCityByCountry(Area area);
}
