package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.MemberService;
import javaCoffe.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

    @Autowired
    private MemberService msrv;

    @GetMapping("/login/login")
    public String login() {
        return "login/login.tiles";
    }


    @PostMapping("/login/login")
    public String loginok(MemberVO mvo, HttpSession sess) {
        String returnPage = "redirect:/login/loginfail";

        if (msrv.checkLogin(mvo, sess)) // 로그인 성공시
            returnPage = "redirect:/index";

        System.out.println("잘되는건가?");
        return returnPage;
    }


    // 일단 여기까지 !!!!!!!!!!!!!!!!!!!!!!
    @GetMapping("/login/loginfail")
    public String loginfail(){
        return "login/loginfail.tiles";
    }

    @PostMapping("/login/loginfail")
    public String loginfailok(MemberVO mvo, HttpSession sess) {
        String returnPage = "redirect:/login/loginfail";

        if (msrv.checkLogin(mvo,sess))
            returnPage = "redirect:/index";

        return returnPage;
    }

}
