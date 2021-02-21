package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.ReviewVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ReviewService {
    Boolean newReview(ReviewVO rvo, MultipartFile[] img);

    List<ReviewVO> readReview(String cp);

    List<ReviewVO> readReview(String cp, String findtype, String findkey);

    int countReview();

    int countReview(String findtype, String findkey);

    ReviewVO readOneReview(String rno);

    Boolean viewCountReview(String rno);

    Boolean delReview(ReviewVO nrvo);

    Boolean updateReview(ReviewVO rvo, MultipartFile[] img, String[] fileck);

    String readPreReview(String rno);

    String readFirstRno();

    String readNextReview(String rno);

    String readLastRno();
}
