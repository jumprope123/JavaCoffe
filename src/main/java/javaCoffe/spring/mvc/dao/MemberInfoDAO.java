package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.MemberVO;

import java.util.List;

public interface MemberInfoDAO {
    MemberVO readOneMemberInfo(String uid);
}
