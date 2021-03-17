package javaCoffe.spring.mvc.service;


import javaCoffe.spring.mvc.vo.*;

import java.util.List;


public interface BuyPageService {
    EshopVO readMD(String code);

    MemberVO readUser(String userid);

    int insertData(BuyPageVO buyvo);

    int changePoint(BuyPageVO buyvo);

    int changePoint(BuyPageBindVO bbvo);

    List<MyBasket_EshopVO> readMBEL(int int_lmbno[]);

    int insertBindData(BuyPageBindVO bbvo);
}
