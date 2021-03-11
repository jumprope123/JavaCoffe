package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.MyBasketVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("mbdao")
public class MyBasketDAOImpl implements MyBasketDAO{
    @Autowired
    private SqlSession sqlSession;


    @Override
    public List<MyBasketVO> selectmb(String userid) {
        return sqlSession.selectList("mybasket.selectListmb", userid);
    }

    @Override
    public int insertmb(Map<String, Object> param) {
        return sqlSession.insert("mybasket.insertmb", param);
    }

    @Override
    public int deletemb(String mbno) {
        return sqlSession.delete("mybasket.deletemb",mbno);
    }

    @Override
    public int updatemb(MyBasketVO mbvo) {
        return sqlSession.update("mybasket.updatemb",mbvo);
    }

//    @Override
//    public MyBasketVO selectOnemb(Map<String, Object> param) {
//        return sqlSession.selectOne("mybasket.selectOnemb", param);
//    }
}
