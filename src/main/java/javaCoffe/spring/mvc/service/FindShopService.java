package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.FindShopVO;

import java.util.List;

public interface FindShopService {
    List<FindShopVO> readLocation();

    List<FindShopVO> readFindShop();

    String readLocationjson();
}
