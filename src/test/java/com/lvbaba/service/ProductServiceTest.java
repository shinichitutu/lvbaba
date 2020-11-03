package com.lvbaba.service;

import com.lvbaba.entity.Product;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ProductServiceTest extends TestCase {
    @Resource
    private ProductService productService;

    @Test
    public void testINser() {

    }

}