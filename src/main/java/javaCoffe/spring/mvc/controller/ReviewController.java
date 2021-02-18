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
            rds.addFlashAttribute("checkCaptcha","자동가입방지 확인이 실패했어요");
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

    @PostMapping("review/replyok") //댓글쓰기
    public String replyok(ReviewReplyVO rrvo){
        String returnPage = "redirect:/review/view?rno=" + rrvo.getReviewNo();

        if (rrvo.getCommentNo() == null){ //댓글로 써졋다면
            rrsrv.newReply(rrvo);
        }else { // 대댓글로 써졋다면
            rrsrv.newReReply(rrvo);
        }
        return returnPage;
    }

    @PostMapping("review/replyModiOk") //댓글 수정하기
    public String replyModiOk(ReviewReplyVO rrvo){
        String returnPage = "redirect:/review/view?rno=" + rrvo.getReviewNo();
        rrsrv.updateRePly(rrvo);
        return returnPage;
    }

    @PostMapping("review/replydel")
    public String replydel(ReviewReplyVO rrvo){
        String returnPage = "redirect:/review/view?rno=" + rrvo.getReviewNo();
        rrsrv.delRePly(rrvo);
        return returnPage;
    }

    @GetMapping("review/update")
    public ModelAndView update(ModelAndView mv, String rno){
        return mv;
    }
}
