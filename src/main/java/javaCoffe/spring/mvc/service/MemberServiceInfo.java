package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.MemberVO;

import java.util.List;

public interface MemberServiceInfo {
    MemberVO readOneMemberInfo(String uid);
}
