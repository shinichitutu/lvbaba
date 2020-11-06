package com.lvbaba.utli;

import com.lvbaba.entity.Area;
import com.lvbaba.entity.Product;
import com.lvbaba.entity.Tour;
import com.lvbaba.entity.Userorder;
import com.lvbaba.entityUtil.ProductArea;
import com.lvbaba.service.AreaService;
import com.lvbaba.service.TourService;
import com.lvbaba.service.UserOrderService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.*;


/**
 * Created by YY on 2020/10/28.
 */
public class Util {
    @Resource
    private static AreaService areaService;
    @Resource
    private static TourService tourService;
    @Resource
    private static UserOrderService userOrderService;

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
        Calendar calendar = Calendar.getInstance();
        //减填负数
        calendar.add(Calendar.HOUR, 2);
        return new SimpleDateFormat("HH-mm").format(calendar.getTime());
    }

    //去重Long的集合
    public static List<Long> duplicateRemoval(List<Long> list) {
        List<Long> longList = new ArrayList<>();
        boolean flag = true;
        for (int i = 0; i < list.size(); i++) {
            flag = true;
            for (int j = 0; j < longList.size(); j++) {

                System.out.println(list.get(i).equals(longList.get(j)));

                if (list.get(i).equals(longList.get(j))) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                longList.add(list.get(i));
            }
        }
        return longList;
    }

    /*去重日期*/
    public static List<Tour> de_weightDate(List<Tour> tours) {
        List<Tour> tourList = new ArrayList<>();
        for (int i = 0; i < tours.size(); i++) {
            for (int j = i + 1; j < tours.size(); j++) {
                if (!tours.get(i).getdDate().equals(tours.get(j).getdDate())) {
                    tourList.add(tours.get(i));
                }
            }
        }
        return tours;
    }

    /*去重日期交通*/
    public static List<Tour> de_weightTrans(List<Tour> tours) {
        for (int i = 0; i < tours.size(); i++) {
            for (int j = i + 1; j < tours.size(); j++) {
                if (tours.get(i).getTransType().equals(tours.get(j).getTransType())) {
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
            for (int j = 0; j < longList.size(); j++) {
                if (list.get(i).getdDate().equals(longList.get(j).getdDate())) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                longList.add(list.get(i));
            }
        }
        return longList;
    }


    public static String getCurrentDate() {
        return new SimpleDateFormat("yyyy-MM-dd HH-mm-ss").format(new Date());
    }


    /*退款*/
    public static double refund(String dateString) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date2 = null;
        try {
            date2 = sdf.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        double d = ((date.getTime() - date2.getTime()) / (1000 * 60 * 60 * 24)) * 100;
        if (d >= 0 && d <= 3) {
            return 0.5;
        } else if (d > 3 && d <= 10) {
            return 0.3;
        } else if (d > 10 && d <= 30) {
            return 0.2;
        } else {
            return 0.1;
        }
    }

    /*获取当前时间*/
    public static String getCurrentTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String str_date = sdf.format(date);
        return str_date;

    }

}
