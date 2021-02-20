package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.ReviewVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("rdao")
public class ReviewDAOImpl implements ReviewDAO{

    @Autowired
    private SqlSession sqlSession;


    @Override
    public String insertReview(ReviewVO rvo) {
        //db에 rvo값 저장
        sqlSession.insert("review.insertReview",rvo);
        // return은 id값인 rno를 조사해서 반환
        return sqlSession.selectOne("review.lastReviewID");
    }

    @Override
    public List<ReviewVO> selectReview(int snum) {
        return sqlSession.selectList("review.selectList",snum);
    }

    @Override
    public int selectCountReview() {
        return sqlSession.selectOne("review.countReview");
    }

    @Override
    public List<ReviewVO> findSelectList(Map<String, Object> param) {
        return sqlSession.selectList("review.findSelectList",param);
    }

    @Override
    public int selectCountReview(Map<String, String> param) {
        return sqlSession.selectOne("review.findCountReview",param);
    }

    @Override
    public ReviewVO selectOneReview(String rno) {
        return sqlSession.selectOne("review.selectOne",rno);
    }

    @Override
    public int updateViewCount(String rno) {
        return sqlSession.update("review.viewCount",rno);
    }

    @Override
    public int deleteView(String rno) { return sqlSession.delete("review.deleteOneReview", rno);
    }

    @Override
    public int updateReview(ReviewVO rvo) { return sqlSession.update("review.updateReview",rvo);
    }
}
