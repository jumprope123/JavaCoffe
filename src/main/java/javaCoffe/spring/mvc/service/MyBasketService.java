package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.MyBasketVO;

import java.util.List;

public interface MyBasketService {
    List<MyBasketVO> readProduct(String userid);

//    MyBasketVO readOneMB(String code, Object userid, int salesCnt);

//    boolean newMBProduct(MyBasketVO mbvo);

    boolean removemb(String mbno);

    boolean newMBProduct(String mbcode, Object userid, int mbamount);
}
