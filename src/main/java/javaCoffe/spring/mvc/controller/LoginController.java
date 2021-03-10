package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.MemberService;
import javaCoffe.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;


@Controller
public class LoginController {

    @Autowired
    private MemberService msrv;

    @GetMapping("/login/login")
    public ModelAndView login(ModelAndView mv, String joinorbind) {
        mv.setViewName("login/login.tiles");
        if (joinorbind == null || joinorbind.isEmpty()) { // joinorbind가 없으면 200을 대입. 있으면 100
            joinorbind = "200";
        }
        mv.addObject("joinorbind",joinorbind);
        return mv;
    }


    @PostMapping("/login/login")
    public String loginok(MemberVO mvo, HttpSession sess) {
        String returnPage = "redirect:/login/loginfail";

        if (msrv.checkLogin(mvo, sess)) // 로그인 성공시
            returnPage = "redirect:/index";

        System.out.println("잘되는건가?");
        return returnPage;
    }

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

    @GetMapping("/login/loginDel")
    public String logindel(HttpSession sess){
        sess.removeAttribute("UID");
        return "redirect:/login/login";
    }



//

    // ============================ woo 만약 kakaoID 값을 체크해서 있으면 index 없으면 loginfail로 이동


    //===========================================

}
