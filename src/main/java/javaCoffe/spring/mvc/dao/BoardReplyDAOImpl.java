package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.ReplyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("brdao")
public class BoardReplyDAOImpl implements BoardReplyDAO {
    @Autowired private SqlSession sqlSession;

    @Override
    public List<ReplyVO> selectReply(int bno){
        return sqlSession.selectList("reply.selectListBoard", bno);
    }

    @Override //댓글쓰기
    public int insertReply(ReplyVO rvo){
        rvo.setCno(selectLastRno());
        //댓글 저장시 최근댓글번호을 알아내서 cno에 저장
        return sqlSession.insert("reply.insertBoardReply", rvo);
    }

    @Override //대댓글쓰기
    public int insertReReply(ReplyVO rvo){
        return sqlSession.insert("reply.insertBoardReply", rvo);
    }

    @Override
    public int updateReply(ReplyVO rvo) { return sqlSession.update("reply.updateReplyBoard",rvo); }

    @Override
    public int deleteReply(ReplyVO rvo) { return sqlSession.delete("reply.deleteReplyBoard",rvo); }

    public String selectLastRno(){
        return sqlSession.selectOne("reply.lastRno");
    }
}
