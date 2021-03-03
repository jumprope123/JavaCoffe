package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.ReviewReplyVO;

import java.util.List;

public interface ReviewReplyDAO {
    int insertReply(ReviewReplyVO rrvo);

    List<ReviewReplyVO> selectReply(int reviewNo);

    int insertReReply(ReviewReplyVO rrvo);

    int updateReply(ReviewReplyVO rrvo);

    int delReply(ReviewReplyVO rrvo);

    int checkCntReply(String rno);
}
