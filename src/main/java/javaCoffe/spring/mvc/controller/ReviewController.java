package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.ReviewReplyService;
import javaCoffe.spring.mvc.service.ReviewService;
import javaCoffe.spring.mvc.utils.GoogleCaptchaUtil;
import javaCoffe.spring.mvc.vo.ReviewReplyVO;
import javaCoffe.spring.mvc.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Controller
public class ReviewController {

    @Autowired
    private GoogleCaptchaUtil gcutil;
    @Autowired
    private ReviewService rsrv;
    @Autowired
    private ReviewReplyService rrsrv;


    @GetMapping("/review/write")
    public String review(){
        return "review/write.tiles";
    }

    @PostMapping("/review/write")
    public String write(ReviewVO rvo, HttpServletRequest req, RedirectAttributes rds, MultipartFile[] img){
        String gCaptcha = req.getParameter("g-recaptcha");
        String returnPage = "redirect:/review/write";

        if (gcutil.checkCaptcha(gCaptcha)){
            rsrv.newReview(rvo,img);
            returnPage = "redirect:/review/list?cp=1";
        } else {
            rds.addFlashAttribute("checkCaptcha","자동입력방지 확인이 실패했어요");
            rds.addFlashAttribute("rvo",rvo);
        }
        return returnPage;
    }

    @GetMapping("/review/list")
    public ModelAndView list(ModelAndView mv, String cp){
        mv.setViewName("review/list.tiles");
        mv.addObject("reviews",rsrv.readReview(cp));
        mv.addObject("reviewCnt",rsrv.countReview());
        return mv;
    }

    @GetMapping("/review/find")
    public ModelAndView find(ModelAndView mv, String findtype, String findkey, String cp){
        mv.setViewName("review/list.tiles");
        mv.addObject("reviews", rsrv.readReview(cp, findtype, findkey));
        mv.addObject("reviewCnt",rsrv.countReview(findtype, findkey));
        return mv;
    }

    @GetMapping("/review/view")
    public ModelAndView view(ModelAndView mv, String rno){
        mv.setViewName("review/view.tiles");
        mv.addObject("review", rsrv.readOneReview(rno)); // 상세본문 읽어오기
        mv.addObject("rp", rrsrv.readReply(rno)); //리플 읽어오기
        rsrv.viewCountReview(rno); // 본문 조회수 증가시키기
        return mv;
    }

    @PostMapping("/review/replyok") //댓글쓰기
    public String replyok(ReviewReplyVO rrvo){
        String returnPage = "redirect:/review/view?rno=" + rrvo.getReviewNo();

        if (rrvo.getCommentNo() == null){ //댓글로 써졋다면
            rrsrv.newReply(rrvo);
        }else { // 대댓글로 써졋다면
            rrsrv.newReReply(rrvo);
        }
        return returnPage;
    }

    @PostMapping("/review/replyModiOk") //댓글 수정하기
    public String replyModiOk(ReviewReplyVO rrvo){
        String returnPage = "redirect:/review/view?rno=" + rrvo.getReviewNo();
        rrsrv.updateRePly(rrvo);
        return returnPage;
    }

    // 댓글 삭제하기
    @PostMapping("/review/replydel")
    public String replydel(ReviewReplyVO rrvo){
        String returnPage = "redirect:/review/view?rno=" + rrvo.getReviewNo();
        rrsrv.delRePly(rrvo);
        return returnPage;
    }

    // 후기 게시글 수정하기
    @GetMapping("/review/update")
    public ModelAndView update(ModelAndView mv, String rno){
        ReviewVO rvo = rsrv.readOneReview(rno);
        mv.setViewName("review/update.tiles");
        mv.addObject("rvo",rvo);
        return mv;
    }

    // 후기게시글 삭제하기
    @PostMapping("/review/delview")
    public String delview(String rno){
    ReviewVO nrvo = rsrv.readOneReview(rno);
    rsrv.delReview(nrvo);
    return "redirect:/review/list?cp=1";
    }

    // 수정페이지
    @PostMapping("/review/update")
    public String update(ReviewVO rvo, HttpServletRequest req, RedirectAttributes rds, MultipartFile[] img ){
        String gCaptcha = req.getParameter("g-recaptcha");
        String returnPage = "redirect:/review/update?rno=" + rvo.getRno();
        String[] fileck = new String[]{req.getParameter("fileck1"), req.getParameter("fileck2"), req.getParameter("fileck3"), req.getParameter("fileck4"), req.getParameter("fileck5")};

        if (gcutil.checkCaptcha(gCaptcha)){
            rsrv.updateReview(rvo, img, fileck);
            returnPage = "redirect:/review/view?rno=" + rvo.getRno();
        }else {
            rds.addFlashAttribute("checkCaptcha","자동입력 방지확인이 실패했어요");
        }
        return returnPage;
    }

    // 이전페이지로
    @GetMapping("review/prevView")
    public String preView(String rno){
        String preRno = rsrv.readPreReview(rno); // rno값을 받아서 전 rno를 조회해서 보낸다. 만약 최신이라면 그대로 보낸다.

        if (preRno == null) {
            preRno = rsrv.readFirstRno();
        }
        return "redirect:/review/view?rno=" + preRno;
    }

}
