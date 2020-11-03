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
import sun.java2d.pipe.AAShapePipe;

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
        model.addAttribute("pages",tourPageInfo.getPages());
        model.addAttribute("page",Integer.valueOf(page));
        model.addAttribute("products",products);
        return "showProduct";
    }

    @RequestMapping("searchProducts.do")
    public String searchProducts(Product product,String page,Model model){
        if (page==null){
            page="1";
        }
        PageHelper.startPage(Integer.valueOf(page),5);
        List<Product> productList=productService.querByOthers(product);
        PageInfo<Product> tourPageInfo = new PageInfo<>(productList);
        model.addAttribute("products",productList);
        model.addAttribute("pages",tourPageInfo.getPages());
        model.addAttribute("page",Integer.valueOf(page));
        return "searchProducts";
    }

    @RequestMapping("searchProductMain.do")
    public String searchProductMain(String aimArea,String deArea,Model model){
        System.out.println("测试"+aimArea+deArea);
        List<Product> productList=productService.queryByAreaName(deArea,aimArea);
        int count =productList.size();
        model.addAttribute("product",productList);
        model.addAttribute("aimArea",aimArea);
        model.addAttribute("deArea",deArea);
        model.addAttribute("count",count);
        return "userProductsResult";
    }


    @RequestMapping("productOne.do")
    public String productOne(Product product,Model model){
        model.addAttribute("product",product);
        return "productOne";
    }

    @RequestMapping("/addProductInfo.do")
    @ResponseBody
    public String addProductInfo(Product product){
        System.out.println(product);
        boolean flag = productService.insertProduct(product);
        return ""+flag;
    }

    @RequestMapping("/deleteProduct.do")
    public String deleteProduct(Product product,Model model){
        boolean flag = productService.removeProduct(product);
        if (flag){
            model.addAttribute("delProductInfo","删除成功");
        }else{
            model.addAttribute("delProductInfo","删除失败");
        }
        return "forward:showProduct.do";
    }

    @RequestMapping("/updateProductInfo.do")
    @ResponseBody
    public String modifyProduct(Product product){
        boolean flag = productService.updateProduct(product);
        return ""+flag;
    }
}
