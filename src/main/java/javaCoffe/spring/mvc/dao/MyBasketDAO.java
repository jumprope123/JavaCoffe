package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.MyBasketVO;

import java.util.List;
import java.util.Map;

public interface MyBasketDAO {
    List<MyBasketVO> selectmb(String userid);

    int insertmb(Map<String, Object> param);

    int deletemb(String mbno);

    int updatemb(MyBasketVO mbvo);

//    MyBasketVO selectOnemb(Map<String, Object> param);
}
