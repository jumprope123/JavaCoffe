package javaCoffe.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mbdao")
public class MyBasketDAOImpl implements MyBasketDAO{
    @Autowired
    private SqlSession sqlSession;


}
