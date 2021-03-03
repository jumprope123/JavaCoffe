package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyService {
 List<ReplyVO> readReply(String bno);

 boolean newReply(ReplyVO rvo);

 boolean newReReply(ReplyVO rvo);
}
