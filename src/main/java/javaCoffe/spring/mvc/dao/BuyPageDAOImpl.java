package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.*;
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

    @Override
    public int insertData(BuyPageVO buyvo) {
        return sqlSession.insert("buyPage.insertData",buyvo);
    }

    @Override
    public int changePoints(Map<String, Object> map) {
        return sqlSession.update("buyPage.changePoints",map);
    }

    @Override
    public List<MyBasket_EshopVO> selectMBEL(int[] mbno) {
        return sqlSession.selectList("buyPage.selectMBEL",mbno);
    }

    @Override
    public int insertBindData(BuyPageBindVO bbvo) {
        return sqlSession.insert("buyPage.insertBindData",bbvo);
    }


}
