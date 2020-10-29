package com.lvbaba.utli;

import com.lvbaba.entity.Area;
import com.lvbaba.entity.Product;
import com.lvbaba.entityUtil.ProductArea;
import com.lvbaba.service.AreaService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by YY on 2020/10/28.
 */
public class Util {

    @Resource
    private static AreaService areaService;

    public static List<ProductArea> queryProductArea(List<Product> products){
        List<ProductArea> productAreas=new ArrayList<>();
        for (Product product:products) {
            Area area=new Area();
            //目的地
            area.setAreaId(product.getarrAreaId());
            System.out.println("!!!!!!!!!!!1");
            System.out.println(area);
            Area departArea=areaService.queryOne(area);
            System.out.println("!!!!!!!!!!!1");
            System.out.println(departArea);
            //出发地
            area.setAreaId(product.getdaId());
            Area destinationArea=areaService.queryOne(area);

            ProductArea productArea=new ProductArea(product,departArea.getCity(),departArea.getCity());
            productAreas.add(productArea);
        }
        return productAreas;
    }
}
