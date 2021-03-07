package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.EshopVO;
import javaCoffe.spring.mvc.vo.MemberVO;

import java.util.Map;


public interface BuyPageDAO {
    EshopVO selectMD(String code);

    MemberVO selectUser(String userid);
}
