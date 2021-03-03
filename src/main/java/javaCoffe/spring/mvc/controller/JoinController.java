package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.MemberService;
import javaCoffe.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class JoinController {

    @Autowired
    private MemberService msrv;


    @Autowired
    public JoinController(MemberService msrv) {
        this.msrv = msrv;
    }

    @GetMapping("/join/agree")
    public String agree() {
        return "join/agree.tiles";
    }

    @GetMapping("/join/checkme")
    public String checkme() {
        return "join/checkme.tiles";
    }

    @GetMapping("/join/joinme") // 회원가입 폼
    public String joinme() {
        return "join/joinme.tiles";
    }

    @PostMapping("/join/joinme") // 회원가입처리
    public String joinmeok(MemberVO mvo) {

        System.out.println(msrv.newMember(mvo));
        return "redirect:/join/joinok";
    }

    @GetMapping("/join/joinok")
    public String joinok() {
        return "join/joinok.tiles";
    }

    // 우편번호 검색
    // /join/zipcode?dong=동이름
    // 검색된 결과를 뷰페이지 없이 바로 응답으로 출력 : REST 방식 (결과페이지없이는 void로 선언)
    // 서블릿에서 제공하는 HttpServletResponse 객체를 이용하면
    // 스프링의 뷰리졸버 없이 응답을 출력할 수 있음
    // 결과는 자바스크립트 ajax로 적절히 가공해서 폼에 출력

    @ResponseBody // 결과페이지 없이 바로 처리할수 있음
    @GetMapping("/join/zipcode")
    public void zipcode(String dong, HttpServletResponse res) {
        try {
            // 응답결과의 유형은 json 으로 설정
            res.setContentType("application/json; charset=UTF-8");

            // 응답결과를 브라우져로 보냄
            res.getWriter().print(msrv.findZipcode(dong));
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
    // 아이디 중복체크
    // /join/checkuid?uid=아이디
    // 사용가능 아이디 : 0
    // 사용 불가능 아이디(다른 사람이 사용중) : 1
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
