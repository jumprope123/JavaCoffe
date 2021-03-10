package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpSession;
import java.util.Map;
//
public interface MemberService {

    String newMember(MemberVO mvo);

    String checkUserid(String uid);

    boolean checkLogin(MemberVO mvo, HttpSession sess);

    String readRegDate(String name);

    int compareID(int kakaoID);

    String getUserId(int kakaoID);

}
