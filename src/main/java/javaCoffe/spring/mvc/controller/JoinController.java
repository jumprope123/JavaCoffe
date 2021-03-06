package javaCoffe.spring.mvc.controller;
import javaCoffe.spring.mvc.service.MemberService;
import javaCoffe.spring.mvc.utils.GoogleCaptchaUtilforJoin;
import javaCoffe.spring.mvc.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class JoinController {

    private MemberService msrv;
    private GoogleCaptchaUtilforJoin guctilfj;


    public JoinController (MemberService msrv, GoogleCaptchaUtilforJoin guctilfj) {
        this.msrv = msrv;
        this.guctilfj = guctilfj;
    }

    @GetMapping("/join/agree")
    public String agree() {
        return "join/agree.tiles";
    }

    @GetMapping("/join/checkme")
    public String checkme() {
        return "join/checkme.tiles";
    }

    @PostMapping ("/join/joinme") // 회원가입 폼  뭐가 문제지<<<<<<<<<<<<<<<<<
    public ModelAndView joinme(String name2, String jumin1, String jumin2) throws UnsupportedEncodingException {
        // 뷰객체로 생성
        // jsp로 객체 넘김
        // list
        ModelAndView mv = new ModelAndView();
        mv.setViewName("join/joinme.tiles");
        mv.addObject("name2",name2);
        mv.addObject("jumin1",jumin1);
        mv.addObject("jumin2",jumin2);

        return mv;
    }

    @PostMapping("/join/joinmeok") // 회원가입처리 뭐가 문제지<<<<<<<<<<<<<<<<<
    public String joinmeok(MemberVO mvo,
                           HttpServletRequest req,
                           RedirectAttributes rds) throws UnsupportedEncodingException {

        // 질의문자열에 한글을 포함시키려면
        // 반드시 URLEncoder를 이용해서 한글에 대한 적절한 인코딩이 필요
        String param = "?name=" + URLEncoder.encode(mvo.getName(),"UTF-8");
        param += "&jumin1=" + mvo.getJumin().split("-")[0];
        param += "&jumin2=" + mvo.getJumin().split("-")[1];
        String returnPage = "redirect:/join/joinme" + param;



        // 클라이언트에서 생성한 captcha 코드를 가져옴
        String gCaptcha = req.getParameter("g-recaptcha");

        // captcha코드의 유효성을 확인함
        // 결과 : true => 테이블에 회원정보 저장, /join/joinok 이동
        // 결과 : false =>  /join/joinme 이동
        if (guctilfj.checkCaptchaforJoin(gCaptcha)) {
            msrv.newMember(mvo); // <<<<<<<<<<<<<<<<<<<<

            String regdate = msrv.readRegDate(mvo.getName());

            returnPage = "redirect:/join/joinok?name=" +
                    URLEncoder.encode(mvo.getName(),"UTF-8")+"&email="+mvo.getEmail()+"&regdate="+regdate;
        }else {
            rds.addFlashAttribute("checkCaptchaforJoin","자동가입방지 확인이 실패했어요");
            rds.addFlashAttribute("mvo",mvo);
        }
        return returnPage;

    }

    @GetMapping("/join/joinok")
    public ModelAndView joinok(ModelAndView mv,String name, String email, String regdate) {
        // 방금 가입한 회원의 이름,이메일,가입일을 추출
        // 모델(mvo)에 담아서 joinok.jsp로 보냄
        mv.setViewName("join/joinok.tiles");
        mv.addObject("name",name);
        mv.addObject("email",email);
        mv.addObject("regdate",regdate);
        return mv;
    }

    // 아이디 중복체크
    // /join/checkuid?uid=아이디
    // 사용가능 아이디 : 0
    // 사용 불가능 아이디(다른 사람이 사용중) : 1
    @ResponseBody
    @GetMapping("/join/checkuid")

    public void checkuid(String uid,
                       HttpServletResponse res) {

      try {
          res.getWriter().print(msrv.checkUserid(uid));
       }catch (Exception ex) {
           ex.printStackTrace();
        }

    }
}
//