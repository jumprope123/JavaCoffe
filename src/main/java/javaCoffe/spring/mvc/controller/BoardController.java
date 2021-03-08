package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.BoardReplyService;
import javaCoffe.spring.mvc.service.BoardService;
import javaCoffe.spring.mvc.utils.FileUpDownUtil;
import javaCoffe.spring.mvc.utils.GoogleCaptchaUtil;
import javaCoffe.spring.mvc.vo.BoardVO;
import javaCoffe.spring.mvc.vo.ReplyVO;
import javaCoffe.spring.mvc.vo.ReviewReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class BoardController {

    private BoardService bsrv;
    private GoogleCaptchaUtil gcutil;
    private BoardReplyService brsrv;
    private FileUpDownUtil fud;

    @Autowired
    public BoardController(BoardService bsrv, GoogleCaptchaUtil gcutil, BoardReplyService brsrv, FileUpDownUtil fud) {
        this.bsrv = bsrv;
        this.gcutil = gcutil;
        this.brsrv = brsrv;
        this.fud = fud;
    }

    @GetMapping("/board/list")//게시판 목록 출력
    public ModelAndView list(ModelAndView mv, String cp){
        //if (cp == null) cp = "1";
        //header.jsp에 ?cp=1를 추가했기 때문에 더이상 필요 없음

        mv.setViewName("board/list.tiles");
        mv.addObject("bds", bsrv.readBoard(cp));
        mv.addObject("bdcnt", bsrv.countBoard()); //총게시물 수

        return mv;
    }

    @GetMapping("/board/view")//게시판 본문글 출력
    public ModelAndView view(String bno, ModelAndView mv){
        mv.setViewName("board/view.tiles");

        mv.addObject("bd", bsrv.readOneBoard(bno));
        mv.addObject("rp", brsrv.readReply(bno));
        bsrv.viewCountBoard(bno); //조회수 증가

        return mv;
    }

    @GetMapping("/board/write")//새글쓰기 폼
    public ModelAndView write(String bno, ModelAndView mv, HttpSession sess){
        mv.setViewName("board/write.tiles");
        mv.addObject("bd", bsrv.readOneBoard(bno));

//        //로그인 했으면 새글쓰기 폼 출력
//        if(sess.getAttribute("UID") != null)
//            returnPage = "board/write.tiles";

        return mv;
    }

    @PostMapping("/board/writeok") //파일업로드
    public String writeok(BoardVO bvo, MultipartFile[] file, HttpServletRequest req, RedirectAttributes rds){
        String gCaptcha = req.getParameter("g-recaptcha");
        String returnPage = "redirect:/board/write";

        if (gcutil.checkCaptcha(gCaptcha)){
            bsrv.newBoard(bvo, file);
            returnPage = "redirect:/board/list?cp=1";
        } else {
            rds.addFlashAttribute("checkCaptcha","자동입력방지 확인이 실패했어요");
            rds.addFlashAttribute("bvo",bvo);
        }

        return returnPage;
    }

    @ResponseBody
    @GetMapping("/board/down")//첨부파일 다운로드하기
    public void pdown(String bno, String order, HttpServletResponse res){
        try {
            BoardVO p = bsrv.readOneFname(bno, order);
            System.out.println(p.getFname1() +"/"+p.getUuid());
            fud.procDownloadV2(p.getFname1(), p.getUuid(), res);
            bsrv.downCountBoard(bno, order);   //첨부파일 다운수 처리

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @GetMapping("/board/update") //수정하기 폼
    public ModelAndView update(String bno, ModelAndView mv, HttpSession sess){

        //로그인했으면 수정하기 창이 보이고 아니면 인덱스 화면으로 넘어감
//        if(sess.getAttribute("UID") != null && bno != null) {
        mv.setViewName("board/update.tiles");
        mv.addObject("bd", bsrv.readOneBoard(bno));
//        }else {
//            mv.setViewName("redirect:/index");
//        }
        return mv;
    }

    @PostMapping("/board/update") //수정하기 완료
    public String updateok(BoardVO bvo, String cp,HttpServletRequest req, HttpSession sess, String userid){
        String gCaptcha = req.getParameter("g-recaptcha");
        String param = "?bno=" + bvo.getBno();
        param += "&cp=" + cp;
        String returnPage = "redirect:/board/update" + param;

        //로그인한 사용자이면서 수정하는 글이 자신이 쓴것이라면
        //if(sess.getAttribute("UID").equals(userid) && bsrv.modifyBoard(bvo)) {
        if (gcutil.checkCaptcha(gCaptcha)){
            bsrv.modifyBoard(bvo);

            returnPage = "redirect:/board/view" + param;
        }
        //}
        return returnPage;
    }

    @GetMapping("/board/delete") //삭제하기
    public String delete(String bno, String cp, HttpSession sess, String userid){
        //추가적으로 작성해야하는 코드 : 보안측면
        //삭제하려면 로그인필요
        //또한, 자기가 작성한 글만 삭제 가능

        //if(sess.getAttribute("UID").equals(userid))
        bsrv.removeBoard(bno);

        return "redirect:/board/list?cp=" + cp;
    }

    @GetMapping("/board/find") //검색기능
    //게시물 검색을 위한 url 호출방법: /board/find?findtype=title&findkey=기생충&cp=1
    public ModelAndView find(ModelAndView mv, String cp, String findtype, String findkey) {
        mv.setViewName("board/list.tiles");
        mv.addObject("bds", bsrv.readBoard(cp, findtype, findkey));
        mv.addObject("bdcnt", bsrv.countBoard(findtype, findkey));

        return mv;
    }

    @ResponseBody 
    @GetMapping("/board/thumbUp")   //추천기능
    public void thumbUp(String bno, String checkThumb, HttpServletResponse res){
        String ThumbCnt = bsrv.updateThumb(bno, checkThumb);
        res.setContentType("application/json; charset=UTF-8");
        try {
            res.getWriter().print(ThumbCnt);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 이전페이지로
    @GetMapping("/board/prevView")
    public String preView(String bno,String cp){
        String preBno = bsrv.readPreBoard(bno); // bno값을 받아서 전 bno를 조회해서 보냄.

        if (preBno == null) {
            preBno = bsrv.readFirstBno();
        }
        String param = "?bno=" + preBno;
        param += "&cp=" + cp;

        String returnPage = "redirect:/board/view" + param;

        return returnPage ;
    }

    // 다음페이지로
    @GetMapping("/board/nextView")
    public String nextView(String bno,String cp){
        String nextBno = bsrv.readNextBoard(bno);

        if (nextBno == null){
            nextBno = bsrv.readLastBno();
        }

        String param = "?bno=" + nextBno;
        param += "&cp=" + cp;

        String returnPage = "redirect:/board/view" + param;

        return returnPage ;
    }

    //댓글쓰기
    @PostMapping("/board/replyok")
    public String replyok(ReplyVO rvo){
        String returnPage = "redirect:/board/view?bno=" + rvo.getBno();

        if(rvo.getCno() == null) brsrv.newReply(rvo);
        else brsrv.newReReply(rvo);

        return returnPage;
    }

    //댓글 수정하기
    @PostMapping("/board/replyModiOk")
    public String replyModiOk(ReplyVO rvo){

        String returnPage = "redirect:/board/view?bno=" + rvo.getBno();
        brsrv.updateRePly(rvo);
        return returnPage;
    }

    // 댓글 삭제하기
    @PostMapping("/board/delreply")
    public String replydel(ReplyVO rvo){
        String returnPage = "redirect:/board/view?bno=" + rvo.getBno();
        brsrv.delRePly(rvo);
        return returnPage;
    }
}
