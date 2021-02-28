package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.MemberVO;
import javaCoffe.spring.mvc.vo.ZipcodeVO;

import java.util.List;

public interface MemberDAO {

    int insertMember(MemberVO mvo);

    List<ZipcodeVO> selectZipcode(String dong);

    int selectOneUserid(String uid);

    int selectLogin(MemberVO mvo);
}
