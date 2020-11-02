package com.lvbaba.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.entity.*;
import com.lvbaba.service.AreaService;
import com.lvbaba.service.HotelService;
import com.lvbaba.service.ProductService;
import com.lvbaba.service.RoomService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
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

    @RequestMapping("productOne.do")
    public String productOne(Product product,Model model){
        model.addAttribute("product",product);
        return "productOne";
    }

    @RequestMapping("/addProductInfo.do")
    public String addProductInfo(Product product, MultipartFile file, HttpServletRequest request,Model model){
        if(file==null){
            model.addAttribute("error","重新选择");
            return "forward:showProduct.do";
        }
        //获取文件名字
        String fileName = file.getOriginalFilename();
        // 获取文件上传要保存到的文件地址
        String path = request.getSession().getServletContext().getRealPath("/upload");
        // 如果文件夹不存在则创建该文件夹
        File file1 = new File(path+File.separator+fileName);
        //不存在
        if(!file1.getParentFile().exists()){
            file1.mkdirs();
        }
        try {
            file.transferTo(file1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Files files = new Files();
        files.setFilePath("/upload"+File.separator+fileName);
        System.out.println("地址Wie："+"/upload"+File.separator+fileName);
        boolean flag = productService.insertProduct(product,files);
        if (flag){
            model.addAttribute("addProduct","新增成功");
        }else{
            model.addAttribute("addProduct","新增失败");
        }
        return "forward:showProduct.do";
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
    public String modifyProduct(Product product, MultipartFile file1, HttpServletRequest request,Model model){
        System.out.println("-----------------"+file1);
        System.out.println("-----------------"+product);
        if(file1==null){
            model.addAttribute("error","重新选择");
            return "forward:showProduct.do";
        }
        //获取文件名字
        String fileName = file1.getOriginalFilename();
        // 获取文件上传要保存到的文件地址
        String path = request.getSession().getServletContext().getRealPath("/upload");
        // 如果文件夹不存在则创建该文件夹
        File file2 = new File(path+File.separator+fileName);
        //不存在
        if(!file2.getParentFile().exists()){
            file2.mkdirs();
        }
        try {
            file1.transferTo(file2);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Files files = new Files();
        files.setFilePath("/upload"+File.separator+fileName);
        System.out.println("修改地址为：--------"+"/upload"+File.separator+fileName);
        boolean flag = productService.updateProduct(product,files);
        if (flag){
            model.addAttribute("modifyProduct","修改成功");
        }else{
            model.addAttribute("modifyProduct","修改失败");
        }
        return "forward:showProduct.do";
    }
}
