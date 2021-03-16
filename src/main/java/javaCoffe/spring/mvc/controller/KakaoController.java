package javaCoffe.spring.mvc.controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import javaCoffe.spring.mvc.service.MemberService;

import javaCoffe.spring.mvc.vo.MemberVO;
import javaCoffe.spring.mvc.vo.OAuthToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;


import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;


@Controller
public class KakaoController {
    @Autowired
    MemberService memberService;

    // =====================카카오 토큰 및 정보 받는 코드 ================================
    @GetMapping(value = "/auth/kakao/callback", produces="text/plain;charset=UTF-8")  // <<<<<<< 이게 한글의 핵심
    public String kakaoCallback(String code,HttpSession sess)throws IOException {

        // POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
        // RestTemplate
        RestTemplate rt = new RestTemplate();
        // http 요청을 쉽게 할수 있는 라이브러리 HttpHeader 오브젝트 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // Httpbody 오브젝트 생성
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "9c38cdfacc89f99ac0fe0615bba90cd9");
        params.add("redirect_uri", "http://13.125.205.40:8080/auth/kakao/callback");
        params.add("code", code);

        // HttpHeader와 Httpbody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
                new HttpEntity<>(params, headers);  //<<< 헤더값과 파람스값(바디)을 갖게 됨


        // Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음. kakaoTokenRequest 담아서 받기기
        ResponseEntity<String> response = rt.exchange(
                "https://kauth.kakao.com/oauth/token", // 토큰발급 요청 주소
                HttpMethod.POST,
                kakaoTokenRequest,
                String.class
        );

        // Gson, Json Simple, ObjectMapper 라이브러리
        ObjectMapper ob = new ObjectMapper();
        OAuthToken oauthToken = null;
        try {
            oauthToken = ob.readValue(response.getBody(), OAuthToken.class);
        } catch (JsonMappingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println("kakao access token:" + oauthToken.getAccess_token());


        //================================================

        RestTemplate rt2 = new RestTemplate();

        //HttpHeader 오브젝트 생성
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token()); // Bearer 사이에 한칸띄는게 포인트
        headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HttpHeader와 Httpbody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
                new HttpEntity<>(headers2);  //<<< 헤더값과 파람스값(바디)을 갖게 됨

        // Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음. kakaoTokenRequest 담아서 받기기
        ResponseEntity<String> response2 = rt2.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.POST,
                kakaoProfileRequest2,
                String.class
        );
        System.out.println(response2.getBody());  //<<<<< json view로 하니까 오류가 나서 원본상태로 보기 위한 코드


        //======================================
        ObjectMapper ob2 = new ObjectMapper();
        KakaoProfile kakaoProfile = null;
        try {
            kakaoProfile = ob2.readValue(response2.getBody(), KakaoProfile.class);
        } catch (JsonMappingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        System.out.println("kakao ID(Kno) :" + kakaoProfile.getId());
        System.out.println("kakao Email :" + kakaoProfile.getKakao_account().getEmail());


        System.out.println("kakao Username: " + kakaoProfile.getKakao_account().getEmail() + "_" + kakaoProfile.getId());
        System.out.println("kakaoblog Username: " + kakaoProfile.getKakao_account().getEmail());
        UUID garbagePassword = UUID.randomUUID();  // <<< 쓰레기값 패스워드
        System.out.println("kakaoblog password: " + garbagePassword);

        String returnPage = "redirect:/index";
//
        int kakaoID = kakaoProfile.getId();
        int resultkakao = memberService.compareID(kakaoID);

        String userid = memberService.checkUserid("uid");
        int resultour = memberService.compareID(kakaoID);

        String uidUID = (String) sess.getAttribute("UID");
        System.out.println("-------------------");
        System.out.println("this kakaoID val : " + kakaoID);
        System.out.println("this user val : " + uidUID);
        System.out.println("-------------------");


        if (uidUID == null) { //로그인 하지 않은 경우
            // 카카오로그인 하기를 눌러서 로그인 한 경우
            if (resultkakao == 0) { //우리 데이터베이스에 없는 카카오아이디다

                System.out.println("로그인실패");
                returnPage = "redirect:/login/login?joinorbind=100";

            } else { // 우리 데이터베이스에 있는 카카오 아이디다. 그래서 session값에 해당 카카오아이디와 맞는 userid를 찾아와서 넣어준다. 즉 로그인시킨다.
                returnPage = "redirect:/index";
                userid = memberService.getUserId(kakaoID);
                sess.setAttribute("UID",userid);
            }

        }else { //로그인을 한 경우 즉, 연동하기 버튼을 눌렀을때
           int cnt = memberService.inputKakao(uidUID,kakaoID); //session값과 kakaoid값을 가지고 가서 연동을 시켜준다.
            sess.setAttribute("AboutKakao",1); //왜냐! 카카오아이디를 연동했으니까. 연동하기가 없어져야 하니까!
            returnPage = "redirect:/index";
        }
        System.out.println("-------------------");                  /*<<<<<<<<<<<<<<<<<<<<<<< 여기까지 진행되는지?*/
        System.out.println("this kakaoID val : " + kakaoID);
        System.out.println("this user val : " + uidUID);
        System.out.println("-------------------");
        return returnPage;
    }
}
