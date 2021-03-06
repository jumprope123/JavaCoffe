package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.MemberVO;


public interface MemberDAO {

    int insertMember(MemberVO mvo);

    int selectOneUserid(String uid);

    int selectLogin(MemberVO mvo);

    String readRegdate(String name);
}
