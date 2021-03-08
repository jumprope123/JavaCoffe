package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;

import java.util.List;
import java.util.Map;

public interface AdminDAO {
    String insertNewProduct(EshopVO evo);

    List<BuyPageVO> readAllData(int snum);

    void processModify(Map<String, Object> map);

    int countData();
}
