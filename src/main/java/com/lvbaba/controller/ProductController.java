package com.lvbaba.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.entity.*;
import com.lvbaba.service.*;
import com.lvbaba.utli.Util;
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
    @Resource
    private TourService tourService;
    @Resource
    private CommentService commentService;
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
        /*查询关于产品的评论*/
        Comment comment=new Comment();
        comment.setProductId(product.getProductId());
        List<Comment> comments=commentService.queryCommentByUidAndPid(comment);
        Tour tour=new Tour();
        tour.setProductId(product.getProductId());
        List<Tour> tours=tourService.queryByPid(tour);
        List<Tour> tourList= Util.duplicate(tours);
        model.addAttribute("tours",tourList);
        model.addAttribute("comments",comments);
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
        boolean flag = productService.updateProduct(product,files);
        if (flag){
            model.addAttribute("modifyProduct","修改成功");
        }else{
            model.addAttribute("modifyProduct","修改失败");
        }
        return "forward:showProduct.do";
    }
}
