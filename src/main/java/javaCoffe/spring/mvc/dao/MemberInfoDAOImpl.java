package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("mfsrvc")
public class MemberInfoDAOImpl implements MemberInfoDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public MemberVO readOneMemberInfo(String uid) {
        return sqlSession.selectOne("memberInfo.selectMemberInfo",uid);
    }

}
