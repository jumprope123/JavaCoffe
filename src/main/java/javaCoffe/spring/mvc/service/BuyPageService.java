package javaCoffe.spring.mvc.service;


import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;
import javaCoffe.spring.mvc.vo.MemberVO;


public interface BuyPageService {
    EshopVO readMD(String code);

    MemberVO readUser(String userid);

    int insertData(BuyPageVO buyvo);

    int changePoint(BuyPageVO buyvo);
}