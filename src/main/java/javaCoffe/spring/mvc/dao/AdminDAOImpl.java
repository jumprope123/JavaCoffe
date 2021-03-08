package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("adao")
public class AdminDAOImpl implements AdminDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public String insertNewProduct(EshopVO evo) {
        sqlSession.insert("admin.insertEshop",evo);
        return sqlSession.selectOne("admin.lastEnoId");
    }

    @Override
    public List<BuyPageVO> readAllData() {
        return sqlSession.selectList("admin.selectAllData");
    }

    @Override
    public void processModify(Map<String, Object> map) {
        sqlSession.update("admin.processModify",map);
    }
}
