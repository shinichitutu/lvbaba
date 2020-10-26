package com.lvbaba.controller;

import com.lvbaba.entity.Area;
import com.lvbaba.entity.Product;
import com.lvbaba.service.AreaService;
import com.lvbaba.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
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
    @RequestMapping("/showProduct.do")
    public String showProduct(Model model){
        List<Product> products=productService.queryAll();
        List<Area> areas=areaService.queryCountry();
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
        return showProduct(model);
    }
}
