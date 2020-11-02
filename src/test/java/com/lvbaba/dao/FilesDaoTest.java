package com.lvbaba.dao;

import com.lvbaba.entity.Files;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.io.File;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class FilesDaoTest extends TestCase {
    @Resource
    private FilesDao filesDao;

    @Test
    public void test11() {

    }
}