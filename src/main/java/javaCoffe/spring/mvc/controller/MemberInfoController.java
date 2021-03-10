package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.MemberServiceInfo;
import javaCoffe.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class MemberInfoController {

    @Autowired
    private MemberServiceInfo mfsrvc;

    @GetMapping("/member/memberInfo")
    public ModelAndView memberInfo(ModelAndView mv, HttpSession sess){
        mv.setViewName("member/memberInfo.tiles");
        String UID = (String) sess.getAttribute("UID");
        mv.addObject("UID",UID);
        if (UID !=null || !UID.isEmpty()) {
            mv.addObject("memberInfo", mfsrvc.readOneMemberInfo(UID));
        } //로그인이 안된상태에서 불법접근을 하면 해당 정보는 null이라 오류가 뜨므로 없이 보낸다. 보내자마자 UID가 비어잇으니 인덱스로이동.
        return mv;
    }

}
