package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.*;

import java.util.List;
import java.util.Map;


public interface BuyPageDAO {
    EshopVO selectMD(String code);

    MemberVO selectUser(String userid);


    int insertData(BuyPageVO buyvo);

    int changePoints(Map<String, Object> map);

    List<MyBasket_EshopVO> selectMBEL(int[] mbno);

    int insertBindData(BuyPageBindVO bbvo);
}
