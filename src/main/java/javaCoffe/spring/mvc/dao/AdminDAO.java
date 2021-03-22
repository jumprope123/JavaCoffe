package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.BuyPageBindVO;
import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;

import java.util.List;
import java.util.Map;

public interface AdminDAO {
    String insertNewProduct(EshopVO evo);

    List<BuyPageVO> readAllData(int snum);

    void processModify(Map<String, Object> map);

    void processBindModify(Map<String, Object> map);

    int countData();

    int countBindData();

    int delete_eshop(int eno);

    List<BuyPageVO> readAllDataSearch(Map<String, Object> map);

    List<BuyPageBindVO> readAllBindDataSearch(Map<String, Object> map);

    int countDataSearch(String adminSearchTxt);

    int countBindDataSearch(String adminSearchTxt);

    List<BuyPageBindVO> readAllBindData(int snum);


}
