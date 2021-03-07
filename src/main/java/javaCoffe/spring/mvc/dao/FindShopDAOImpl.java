package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.FindShopVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("fdao")
public class FindShopDAOImpl implements FindShopDAO{
    @Autowired private SqlSession sqlSession;


    @Override
    public List<FindShopVO> selectList() {
        return sqlSession.selectList("findshop.selectList");
    }

    @Override
    public List<FindShopVO> selectLocation() {
        return sqlSession.selectList("findshop.selectLocation");
    }
}
