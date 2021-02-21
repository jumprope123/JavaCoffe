package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.ReviewReplyVO;

import java.util.List;

public interface ReviewReplyService {
    Boolean newReply(ReviewReplyVO rrvo);

    List<ReviewReplyVO> readReply(String reviewNo);

    Boolean newReReply(ReviewReplyVO rrvo);

    Boolean updateRePly(ReviewReplyVO rrvo);

    Boolean delRePly(ReviewReplyVO rrvo);
}
