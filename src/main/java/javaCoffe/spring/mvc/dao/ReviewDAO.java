package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.ReviewVO;

import java.util.List;
import java.util.Map;

public interface ReviewDAO {
    String insertReview(ReviewVO rvo);

    List<ReviewVO> selectReview(int snum);

    int selectCountReview();

    List<ReviewVO> findSelectList(Map<String, Object> param);

    int selectCountReview(Map<String, String> param);

    ReviewVO selectOneReview(String rno);

    int updateViewCount(String rno);

    int deleteView(String rno);

    int updateReview(ReviewVO rvo);

    String selectPreRno(String rno);

    String selectFirstRno();

    String selectNextRno(String rno);

    String selectLastRno();

    int updateThumbPlus(String rno);

    int updateThumbMinus(String rno);

    ReviewVO selectOneThumb(String rno);
}
