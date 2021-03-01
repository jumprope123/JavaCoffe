package javaCoffe.spring.mvc.dao;


import javaCoffe.spring.mvc.vo.EshopVO;

import java.util.List;
import java.util.Map;

public interface EshopDAO {
    List<EshopVO> CoffeInfo(Map<String, Object> param);

    int selectCountBigGenre(String bigGenre);
}