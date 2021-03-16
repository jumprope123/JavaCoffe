package javaCoffe.spring.mvc.service;


import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;
import javaCoffe.spring.mvc.vo.MemberVO;
import javaCoffe.spring.mvc.vo.MyBasket_EshopVO;

import java.util.List;


public interface BuyPageService {
    EshopVO readMD(String code);

    MemberVO readUser(String userid);

    int insertData(BuyPageVO buyvo);

    int changePoint(BuyPageVO buyvo);

    List<MyBasket_EshopVO> readMBEL(int int_lmbno[]);

}
