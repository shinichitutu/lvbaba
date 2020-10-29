package com.lvbaba.dao;

import com.lvbaba.entity.Hotel;
import com.lvbaba.entity.Roomdetail;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by shinichi on 2020/10/23.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")

public class HotelDaoTest {

    @Resource
    private HotelDao hotelDao;

    @Resource
    private RoomDetailDao roomDetailDao;



    @Test
    public void test(){
        Hotel hotel = new Hotel();
        hotel.setHotelId(1);
        System.out.println(hotelDao.queryOne(hotel));
    }

    @Test
    public void testAll(){
        Hotel hotel = new Hotel();
        List<Hotel> list = hotelDao.query(hotel);
        for (Hotel h:list) {
            System.out.println(h);
        }
    }

    @Test
    public void testRoom(){
        Roomdetail roomdetail =new Roomdetail();
        roomdetail.setRdId(1);
        roomdetail.setRdPrice(500);
/*        roomdetail.setRdNumber(10);*/
        System.out.println(roomDetailDao.updateRoomDetail(roomdetail));
    }

}
