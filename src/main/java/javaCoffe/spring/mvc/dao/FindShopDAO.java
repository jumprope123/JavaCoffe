package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.FindShopVO;

import java.util.List;

public interface FindShopDAO{
    List<FindShopVO> selectList();

    List<FindShopVO> selectLocation();
}
