package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.MemberInfoDAO;
import javaCoffe.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("mfdao")
public class MemberServiceInfoImpl implements MemberServiceInfo{

    @Autowired
    private MemberInfoDAO mfdao;

    @Override
    public MemberVO readOneMemberInfo(String uid) {
        return mfdao.readOneMemberInfo(uid);
    }
}
