package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.EshopVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository("edao")
public class EshopDAOImpl implements EshopDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<EshopVO> CoffeInfo(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenre", param);
    }

    @Override
    public int selectCountBigGenre(String bigGenre) {
        return sqlSession.selectOne("eshop.countBigGenre",bigGenre);
    }
}
