package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.ReviewReplyDAO;
import javaCoffe.spring.mvc.vo.ReviewReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("rrsrv")
public class ReviewReplyServiceImpl implements ReviewReplyService{

    @Autowired
    private ReviewReplyDAO rrdao;

    @Override
    public Boolean newReply(ReviewReplyVO rrvo) {
        Boolean isOk = false;
        int cnt = rrdao.insertReply(rrvo);
        if (cnt>0){
            isOk = true;
        }
        return isOk;
    }

    @Override
    public List<ReviewReplyVO> readReply(String reviewNo) {
        return rrdao.selectReply(Integer.parseInt(reviewNo));
    }

    @Override
    public Boolean newReReply(ReviewReplyVO rrvo) {
        Boolean isOk = false;
        int cnt = rrdao.insertReReply(rrvo);
        if (cnt>0)
            isOk = true;
        return isOk;
    }

    @Override
    public Boolean updateRePly(ReviewReplyVO rrvo) {
        Boolean isOk = false;
        int cnt = rrdao.updateReply(rrvo);
        if (cnt > 0)
            isOk = true;
        return isOk;
    }

    @Override
    public Boolean delRePly(ReviewReplyVO rrvo) {
        Boolean isOk = false;
        int cnt = rrdao.delReply(rrvo);
        if (cnt > 0)
            isOk = true;
        return isOk;
    }
}
