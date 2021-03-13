package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.MemberService;
import javaCoffe.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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
//여기서부터
        String userid = (String) sess.getAttribute("UID");
        int result = msrv.readAboutkakao(userid);
        sess.setAttribute("AboutKakao",result); //0이면 연동안함 1이면 연동되잇음.
        System.out.println(result);
        sess.setAttribute("UID", userid);
//여기까지
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
    public String logindel(HttpSession sess, HttpServletRequest request){

        sess.removeAttribute("UID");
        sess.removeAttribute("AboutKakao");

        return "redirect:/login/login";
    }
/////////////////////////////////////////////////////////////////////// 과연 이거인것인가 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   @GetMapping("/auth/kakao/logout")
    public void kakaoLogout(String access_Token) {
        String reqURL ="https://kapi.kakao.com/v1/user/logout";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String result = "";
            String line = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("============================"); /*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
        }
    }

    @RequestMapping(value ="/auth/kakao/logoutok" , method = RequestMethod.POST)
    public String logout(MemberVO mvo, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpSession sess , SessionStatus sessionStatus) {
/*        HttpSession sess = request.getSession(false);  //<<<<<<<<<<<<<<<<<<<<<<<<<< 2021.3.11 수정 2
        request.getSession(true).invalidate();*/

        kakaoLogout((String)sess.getAttribute("access_Token"));
        sessionStatus.setComplete(); // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 2021.3.11 수정 4
        sess.removeAttribute("access_Token");
        sess.removeAttribute("userid");  // <<<<<<<<<<<<<<<<<<<<<<<<<< 2021.3.11 수정 1*/
        sess.invalidate();

        System.out.println("============================"); /*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
        return "redirect:/index";
    }
///////////////////////////////////////////////////////////////////////
}
