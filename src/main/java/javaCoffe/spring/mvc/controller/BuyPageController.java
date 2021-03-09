package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.BuyPageService;
import javaCoffe.spring.mvc.service.MemberService;
import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;
import javaCoffe.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BuyPageController {

    @Autowired
    private BuyPageService buysrv;

    @PostMapping("/buylist/buyPage")
    public ModelAndView buyPage(ModelAndView mv, HttpServletRequest req, String userid){
        mv.setViewName("buylist/buyPage.tiles");
        String code = req.getParameter("eshopViewCode");
        int salesCnt = Integer.parseInt(req.getParameter("eshopViewNum"));
        int priceForResult = Integer.parseInt(req.getParameter("priceForResult"));
        int finalPrice = salesCnt * priceForResult;
        MemberVO mvo = buysrv.readUser(userid); // userid를 이용해 Member의 정보 뽑아옴
        EshopVO evo = buysrv.readMD(code); //넘겨받은 코드를 통해 상품정보 읽어오기, 다만 List<EshopVO>형태로 만들어야 나중에 장바구니랑 jsp 에서 호환가능
        mv.addObject("evo",evo);
        mv.addObject("mvo",mvo);
        mv.addObject("finalPrice",finalPrice);
        mv.addObject("salesCnt",salesCnt);
        return mv;
    }

    @PostMapping("/buylist/buyProcess")
    public String buyPrecess(BuyPageVO buyvo){ //따로 결재를 안할거라서 그냥 String리턴으로 받음
        String returnPage = "redirect:/buylist/buyOK"; //지금은 ok페이지만존재
        int insertResult = buysrv.insertData(buyvo);
        if (insertResult > 0) {
            returnPage = "redirect:/buylist/buyOK";
        }
        buysrv.changePoint(buyvo);//사용한 포인트만큼 차감하고, 적립된 포인트만큼 증가시켜주기
        return returnPage;
    }

    @GetMapping("/buylist/buyOK")
    public String buyOK(){
        return "buylist/buyOK.tiles";
    }
}
