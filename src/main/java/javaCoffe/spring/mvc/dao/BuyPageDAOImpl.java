package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.EshopVO;
import javaCoffe.spring.mvc.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("buydao")
public class BuyPageDAOImpl implements BuyPageDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public EshopVO selectMD(String code) {
        return sqlSession.selectOne("buyPage.selectMD",code);
    }

    @Override
    public MemberVO selectUser(String userid) {return sqlSession.selectOne("buyPage.selectUser",userid);}


}
