package javaCoffe.spring.mvc.service;


import javaCoffe.spring.mvc.vo.EshopVO;


public interface BuyPageService {
    EshopVO readMD(String code);

    void saveBuyData(String userid, String code, int salesCnt, int finalPrice);
}
