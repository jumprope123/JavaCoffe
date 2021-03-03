package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.MemberVO;
import javaCoffe.spring.mvc.vo.ZipcodeVO;

import java.util.List;
import java.util.Map;

public interface MemberDAO {

    int insertMember(MemberVO mvo);

    int selectOneUserid(String uid);

    int selectLogin(MemberVO mvo);

    String readRegdate(String userid);
}
