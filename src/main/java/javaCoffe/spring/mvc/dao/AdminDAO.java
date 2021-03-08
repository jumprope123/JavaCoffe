package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;

import java.util.List;

public interface AdminDAO {
    String insertNewProduct(EshopVO evo);

    List<BuyPageVO> readAllData();
}
