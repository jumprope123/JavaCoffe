package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.EshopVO;

import java.util.Map;


public interface BuyPageDAO {
    EshopVO selectMD(String code);

    void saveBuyData(Map<String, Object> param);
}
