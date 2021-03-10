package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpSession;
//

public interface MemberDAO {

    int insertMember(MemberVO mvo);

    int selectOneUserid(String uid);

    int selectLogin(MemberVO mvo);

    String readRegdate(String name);

    int compareID(int kakaoID);

    String getUserId(int kakaoID);

}
//