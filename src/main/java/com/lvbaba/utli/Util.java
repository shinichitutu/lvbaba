package com.lvbaba.utli;

import com.lvbaba.entity.Area;
import com.lvbaba.entity.Product;
import com.lvbaba.entity.Tour;
import com.lvbaba.entityUtil.ProductArea;
import com.lvbaba.service.AreaService;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

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
            area.setAreaId(product.getArrAreaId());
            Area departArea=areaService.queryOne(area);
            //出发地
            area.setAreaId(product.getDaId());
            Area destinationArea=areaService.queryOne(area);

            ProductArea productArea=new ProductArea(product,departArea.getCity(),departArea.getCity());
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
            cd.add(Calendar.DATE, n);//增加一天
            //cd.add(Calendar.MONTH, n);//增加一个月

            return sdf.format(cd.getTime());

        } catch (Exception e) {
            return null;
        }
    }
    /*去重日期*/
    public static List<Tour> de_weightDate(List<Tour> tours){
        System.out.println("去重之后的");
        List<Tour> tourList=new ArrayList<>();
        for (int i=0;i<tours.size();i++){
            for(int j=i+1;j<tours.size();j++){
                if (!tours.get(i).getdDate().equals(tours.get(j).getdDate())){
                    tourList.add(tours.get(i));
                }
            }
        }
        System.out.println("去重之前的");
        tours.forEach(System.out::println);
        System.out.println("去重之后的");
        tourList.forEach(System.out::println);
        return tours;
    }
    /*去重日期交通*/
    public static List<Tour> de_weightTrans(List<Tour> tours){
        for (int i=0;i<tours.size();i++){
            for(int j=i+1;j<tours.size();j++){
                if (tours.get(i).getTransType().equals(tours.get(j).getTransType())){
                    tours.remove(j);
                }
            }
        }
        return tours;
    }

    public static List<Tour> duplicate(List<Tour> list) {
        List<Tour> longList = new ArrayList<>();
        boolean flag = true;
        for (int i = 0; i < list.size(); i++) {
            flag = true;
            for (int j =0 ;j<longList.size();j++) {
                System.out.println(list.get(i).getdDate().equals(longList.get(j).getdDate()));
                if (list.get(i).getdDate().equals(longList.get(j).getdDate())) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                longList.add(list.get(i));
            }
        }
        System.out.println("去重之前的");
        list.forEach(System.out::println);
        System.out.println("去重之后的");
        longList.forEach(System.out::println);
        return longList;
    }
}
