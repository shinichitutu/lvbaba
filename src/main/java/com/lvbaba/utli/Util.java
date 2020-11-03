package com.lvbaba.utli;

import com.lvbaba.entity.Area;
import com.lvbaba.entity.Product;
import com.lvbaba.entityUtil.ProductArea;
import com.lvbaba.service.AreaService;
import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by YY on 2020/10/28.
 */
public class Util {

    @Resource
    private static AreaService areaService;

    public static List<ProductArea> queryProductArea(List<Product> products) {
        List<ProductArea> productAreas = new ArrayList<>();
        for (Product product : products) {
            Area area = new Area();
            //目的地
            area.setAreaId(product.getArrAreaId());
            Area departArea = areaService.queryOne(area);
            //出发地
            area.setAreaId(product.getDaId());
            Area destinationArea = areaService.queryOne(area);

            ProductArea productArea = new ProductArea(product, departArea.getCity(), departArea.getCity());
            productAreas.add(productArea);
        }
        return productAreas;
    }

    //实现日期加一天
    public static String addDay(String s, int n) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            Calendar cd = Calendar.getInstance();
            cd.setTime(sdf.parse(s));
            //增加一天
            cd.add(Calendar.DATE, n);
            //增加一个月
            //cd.add(Calendar.MONTH, n);

            return sdf.format(cd.getTime());

        } catch (Exception e) {
            return null;
        }
    }

    public static String getDate() {
        Calendar calendar=Calendar.getInstance();
        //减填负数
        calendar.add(Calendar.HOUR, 2);
        return new SimpleDateFormat("HH-mm").format(calendar.getTime());
    }
}
