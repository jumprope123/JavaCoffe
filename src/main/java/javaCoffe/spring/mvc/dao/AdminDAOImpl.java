package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.BuyPageBindVO;
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
    public List<BuyPageVO> readAllData(int snum) {
        return sqlSession.selectList("admin.selectAllData",snum);
    }

    @Override
    public void processModify(Map<String, Object> map) {
        sqlSession.update("admin.processModify",map);
    }

    @Override
    public void processBindModify(Map<String, Object> map) {
        sqlSession.update("admin.processBindModify",map);
    }

    @Override
    public int countData() {
        return sqlSession.selectOne("admin.countData");
    }

    @Override
    public int countBindData() {
        return sqlSession.selectOne("admin.countBindData");
    }

    @Override
    public List<BuyPageVO> readAllDataSearch(Map<String, Object> map) {
        return sqlSession.selectList("admin.selectAllDataSearch",map);
    }

    @Override
    public List<BuyPageBindVO> readAllBindDataSearch(Map<String, Object> map) {
        return sqlSession.selectList("admin.selectAllBindDataSearch",map);
    }

    @Override
    public int countDataSearch(String adminSearchTxt) {
        return sqlSession.selectOne("admin.countDataSearch",adminSearchTxt);
    }

    @Override
    public int countBindDataSearch(String adminSearchTxt) {
        return sqlSession.selectOne("admin.countBindDataSearch",adminSearchTxt);
    }

    @Override
    public List<BuyPageBindVO> readAllBindData(int snum) {
        return sqlSession.selectList("admin.selectAllBindData",snum);
    }
}
