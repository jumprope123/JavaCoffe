package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.MemberDAO;
import javaCoffe.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

//
@Service("msrv")
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberDAO mdao;

    @Override
    public String newMember(MemberVO mvo) {
        String result = "회원가입 실패";
        int cnt = mdao.insertMember(mvo);

        if (cnt > 0) result = "회원가입 성공";
        return result;
    }


    @Override
    public String checkUserid(String uid) {
        String isOk = "0";

        int cnt = mdao.selectOneUserid(uid);
        if (cnt > 0) isOk = "1";

        return isOk;
    }

    @Override //로그인 체크
    public boolean checkLogin(MemberVO mvo, HttpSession sess) {
        boolean isLogin = false;

        // 로그인 성공시 회원정보를 세션에 저장
        // 입력한 아이디/비밀번호가 member 테이블에 있는지 확인
        // 있으면 : 1을 반환, 없으면 : 0을 반환
        if (mdao.selectLogin(mvo) > 0) {
            sess.setAttribute("UID", mvo.getUserid());


            isLogin = true;
        }
        return isLogin;
    }
    @Override
    public String readRegDate(String name) {
        return mdao.readRegdate(name);
    }

    @Override   // 원래 int kakaoID만 했는데 이런식으로 데이터가 있는지 확인하는 구문인데 맞는건지?
    public int compareID(int kakaoID) {
        int compareKakaoID = 0;
        if (mdao.compareID(kakaoID) > 0) {
        //sess.setAttribute("kakaoID", mvo.getKakaoID());
            compareKakaoID = 1;
        }
        return compareKakaoID;
    }

    @Override
    public String getUserId(int kakaoID) {
        return mdao.getUserId(kakaoID);
    }

    @Override
    public int inputKakao(String uidUID, int kakaoID) {
        Map map = new HashMap<String,Object>();
        map.put("uidUID",uidUID);
        map.put("kakaoID",kakaoID);
        return mdao.inputKakao(map);
    }

    @Override
    public int readAboutkakao(String userid) {
        return mdao.readAboutKakao(userid);
    }

}
//