package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.BoardReplyDAO;
import javaCoffe.spring.mvc.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("brsrv")
public class BoardReplyServiceImpl implements BoardReplyService {

    @Autowired private BoardReplyDAO brdao;

    @Override  // 댓글/대댓글 가져오기
    public List<ReplyVO> readReply(String bno) {
        return brdao.selectReply( Integer.parseInt(bno) );
    }

    @Override  // 댓글쓰기
    public boolean newReply(ReplyVO rvo) {
        int cnt = brdao.insertReply(rvo);
        return true;
    }

    @Override //대댓글쓰기
    public boolean newReReply(ReplyVO rvo) {
        int cnt = brdao.insertReReply(rvo);
        return false;
    }

    @Override //댓글수정하기
    public boolean updateRePly(ReplyVO rvo) {
        boolean result = false;
        int cnt = brdao.updateReply(rvo);
        if (cnt > 0 )  result = true;
        return result;
    }

}
