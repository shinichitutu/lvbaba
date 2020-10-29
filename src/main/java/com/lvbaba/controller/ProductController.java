package com.lvbaba.controller;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.entity.Area;
import com.lvbaba.entity.Hotel;
import com.lvbaba.entity.Product;
import com.lvbaba.entity.Room;
import com.lvbaba.entityUtil.ProductArea;
import com.lvbaba.service.AreaService;
import com.lvbaba.service.HotelService;
import com.lvbaba.service.ProductService;
import com.lvbaba.service.RoomService;
import com.lvbaba.utli.Util;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by YY on 2020/10/26.
 * 产品
 */
@Controller
public class ProductController {
    @Resource
    private ProductService productService;
    @Resource
    private AreaService areaService;
    @Resource
    private RoomService roomService;
    @Resource
    private HotelService hotelService;
    @RequestMapping("/showProduct.do")
    public String showProduct(Model model,String page){
        if (page==null){
            page="1";
        }
        PageHelper.startPage(Integer.valueOf(page),5);
        List<Product> products=productService.queryAll();
        PageInfo<Product> tourPageInfo = new PageInfo<>(products);
        List<Area> areas=areaService.queryCountry();
        model.addAttribute("pages",tourPageInfo.getPages());
        model.addAttribute("page",Integer.valueOf(page));
        model.addAttribute("areas",areas);
        model.addAttribute("products",products);
        return "showProduct";
    }
    @RequestMapping("/insertProduct.do")
    public String insertProduct(Product product,Model model){
       if (productService.insertProduct(product)){
           model.addAttribute("success","增加成功");
       }else {
           model.addAttribute("error","增加失败");
       }
       return "forward:showProduct.do";
    }
    @RequestMapping("searchProducts.do")
    public String searchProducts(Product product,String page,Model model){
        if (page==null){
            page="1";
        }
        PageHelper.startPage(Integer.valueOf(page),5);
        List<Product> list=productService.querByOthers(product);
        Area area=new Area();
        //出发地
        area.setAreaId(product.getarrAreaId());
        Area departArea=areaService.queryOne(area);
        //目的地
        area.setAreaId(product.getdaId());
        Area destinationArea=areaService.queryOne(area);
        PageInfo<Product> tourPageInfo = new PageInfo<>(list);
        List<ProductArea> productAreas=new ArrayList<>();
        for (Product p:tourPageInfo.getList()) {
            Room room=new Room();
            room.setrId(p.getHotelId());
            Hotel hotel=new Hotel();
            hotel.sethId(roomService.queryOne(room).gethId());
            ProductArea productArea=new ProductArea(p,destinationArea.getCity(),
                    departArea.getCity(),hotelService.queryOne(hotel));
            productAreas.add(productArea);
        }
        List<Area> arealis=areaService.queryCountry();
        List<Area> country=areaService.queryCountry();
        model.addAttribute("country",country);
        model.addAttribute("arealis",arealis);
        model.addAttribute("daId",product.getdaId());
        model.addAttribute("arrAreaId",product.getarrAreaId());
        model.addAttribute("products",productAreas);
        model.addAttribute("pages",tourPageInfo.getPages());
        model.addAttribute("page",Integer.valueOf(page));
         return "searchProducts";
    }
}
