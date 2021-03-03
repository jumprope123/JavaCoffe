package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpSession;

public interface MemberService {
    String newMember(MemberVO mvo);

    String checkUserid(String uid);

    boolean checkLogin(MemberVO mvo, HttpSession sess);

    Object checkLogin(MemberService msrv);

    String readRegDate(String userid);
}
