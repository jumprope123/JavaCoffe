package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.MyBasketService;
import javaCoffe.spring.mvc.vo.MyBasketVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MyBasketController {

    @Autowired private MyBasketService mbsrv;

    @GetMapping("/mybasket/list")
    public String list(){
        return "mybasket/list.tiles";
    }

    @PostMapping("/mybasket/list")
    public ModelAndView list(ModelAndView mv, HttpServletRequest req, HttpSession sess){
        mv.setViewName("mybasket/list.tiles");
        String mbcode = req.getParameter("eshopViewCode");
        int mbamount = Integer.parseInt(req.getParameter("eshopViewNum"));
        int mbprice = Integer.parseInt(req.getParameter("priceForResult"));
        int totalprice = mbamount * mbprice;
        String userid = (String) sess.getAttribute("UID");
//        MyBasketVO embvo = mbsrv.readOneMB();
        mbsrv.newMBProduct(mbcode, userid, mbamount);
        List<MyBasketVO> mbvo = mbsrv.readProduct(userid);
        mv.addObject("mbvo",mbvo);
        mv.addObject("totalprice",totalprice);
        mv.addObject("mbamount",mbamount);
        return mv;
    }

    @GetMapping("/mybasket/delete") //삭제하기
    public String delete(String mbno, HttpSession sess, String userid){

        if(sess.getAttribute("UID").equals(userid))
            mbsrv.removemb(mbno);

        return "redirect:/mybasket/list";
    }

//    @GetMapping("/mybasket/update") //개수 업데이트 // 수정한 개수 다시 받아야함...
//    public String delete(String mbno, HttpSession sess, String userid){
//
//        //if(sess.getAttribute("UID").equals(userid))
//        mbsrv.updatemb(mbno);
//
//        return "redirect:/mybasket/list";
//    }


}
