package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;
import javaCoffe.spring.mvc.vo.MemberVO;
import javaCoffe.spring.mvc.vo.MyBasket_EshopVO;

import java.util.List;
import java.util.Map;


public interface BuyPageDAO {
    EshopVO selectMD(String code);

    MemberVO selectUser(String userid);


    int insertData(BuyPageVO buyvo);

    int changePoints(Map<String, Object> map);

    List<MyBasket_EshopVO> selectMBEL(int[] mbno);
}
