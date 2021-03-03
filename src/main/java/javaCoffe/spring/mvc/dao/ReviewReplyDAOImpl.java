package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.ReviewReplyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("rrdao")
public class ReviewReplyDAOImpl implements ReviewReplyDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertReply(ReviewReplyVO rrvo) {
        rrvo.setCommentNo(selectLastReplyNo());
        return sqlSession.insert("reply.insertReply",rrvo);
    }

    @Override
    public List<ReviewReplyVO> selectReply(int reviewNo) {
        return sqlSession.selectList("reply.selectList",reviewNo);
    }

    @Override
    public int insertReReply(ReviewReplyVO rrvo) {
        return sqlSession.insert("reply.insertReply",rrvo);
    }

    @Override
    public int updateReply(ReviewReplyVO rrvo) {
        return sqlSession.update("reply.updateReply",rrvo);
    }

    @Override
    public int delReply(ReviewReplyVO rrvo) {
        return sqlSession.delete("reply.deleteReply",rrvo);
    }

    @Override
    public int checkCntReply(String rno) { return sqlSession.selectOne("reply.countReply",rno); }

    private String selectLastReplyNo() {
        return sqlSession.selectOne("reply.lastReplyNo");
    }
}
