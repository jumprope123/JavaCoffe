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

    @Override
    public List<EshopVO> CoffeInfoByThumbs(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreByThumbs", param);
    }

    @Override
    public List<EshopVO> CoffeInfoByThumbsWithSmallGenre(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreByThumbsWithSmallGenre", param);
    }

    @Override
    public int selectCountBigGenre(Map<String, Object> param) {
        return sqlSession.selectOne("eshop.countBigGenreAndSmallGenre",param);
    }

    @Override
    public List<EshopVO> CoffeInfoBySalesVolumn(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreBySalesVolumn", param);
    }

    @Override
    public List<EshopVO> CoffeInfoBySalesVolumnWithSmallGenre(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreBySalesVolumnWithSmallGenre", param);
    }

    @Override
    public List<EshopVO> CoffeInfoByCheap(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreByCheap", param);
    }

    @Override
    public List<EshopVO> CoffeInfoByCheapWithSmallGenre(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreByCheapWithSmallGenre", param);
    }

    @Override
    public List<EshopVO> CoffeInfoByExpensive(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreByExpensive", param);
    }

    @Override
    public List<EshopVO> CoffeInfoByExpensiveWithSmallGenre(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreByExpensiveWithSmallGenre", param);
    }

    @Override
    public List<EshopVO> CoffeInfoByComment(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreByComment", param);
    }

    @Override
    public List<EshopVO> CoffeInfoByCommentWithSmallGenre(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreByCommentWithSmallGenre", param);
    }

    @Override
    public List<EshopVO> CoffeInfoByRegdate(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreByRegdate", param);
    }

    @Override
    public List<EshopVO> CoffeInfoByRegdateWithSmallGenre(Map<String, Object> param) {
        return sqlSession.selectList("eshop.selectCoffeGenreByRegdateWithSmallGenre", param);
    }
}
