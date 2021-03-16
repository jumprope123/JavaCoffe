package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.BuyPageService;
import javaCoffe.spring.mvc.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class BuyPageController {

    @Autowired
    private BuyPageService buysrv;

    // 상품상세페이지 -> 구매페이지
    @PostMapping("/buylist/buyPage")
    public ModelAndView buyPage(ModelAndView mv, HttpServletRequest req, HttpSession sess){
        String userid = (String) sess.getAttribute("UID");
        mv.setViewName("buylist/buyPage.tiles");
        String code = req.getParameter("eshopViewCode");
        int salesCnt = Integer.parseInt(req.getParameter("eshopViewNum"));
        int priceForResult = Integer.parseInt(req.getParameter("priceForResult"));
        int finalPrice = salesCnt * priceForResult;
        MemberVO mvo = buysrv.readUser(userid); // userid를 이용해 Member의 정보 뽑아옴
        EshopVO evo = buysrv.readMD(code); //넘겨받은 코드를 통해 상품정보 읽어오기
        mv.addObject("evo",evo);
        mv.addObject("mvo",mvo);
        mv.addObject("finalPrice",finalPrice);
        mv.addObject("salesCnt",salesCnt);
        return mv;
    }

    // 장바구니 -> 구매페이지
    @PostMapping("/buylist/mb_buyPage")
    public ModelAndView mb_buyPage(ModelAndView mv, HttpSession sess, buyBindVO bbvo){
        mv.setViewName("buylist/mb_buyPage.tiles");

        String userid = (String) sess.getAttribute("UID");
        MemberVO mvo = buysrv.readUser(userid); // userid를 이용해 Member의 정보 뽑아옴

        int bbvoCnt = bbvo.getEno().split(",").length; //총 몇개의 데이터가 넘어왔는지를 bbvoCnt에 담음
        List<buyBindVO> bbvos = new ArrayList<>();

        System.out.println("--------------------------");
        System.out.println(bbvo.getEno());
        System.out.println(bbvo.getFnames());
        System.out.println(bbvo.getBrand());
        System.out.println(bbvo.getTitle());
        System.out.println(bbvo.getShipPay());
        System.out.println(bbvo.getPurchase());
        System.out.println(bbvo.getMycode());
        System.out.println("--------------------------");
        int allproductprice = 0;
        int allshipPay = 2500; //묶음배송시 shipPay는 .. ?

        for (int i=0; i<bbvoCnt; i++){
            String eno = bbvo.getEno().split(",")[i];
            String fnames = bbvo.getFnames().split(",")[i];
            String brand = bbvo.getBrand().split(",")[i];
            String title = bbvo.getTitle().split(",")[i];
            String shipPay = bbvo.getShipPay().split(",")[i];
            String purchase = bbvo.getPurchase().split(",")[i];
            String discount = bbvo.getDiscount().split(",")[i];
            String dcPrice = bbvo.getDcPrice().split(",")[i];
            String ogPrice = bbvo.getOgPrice().split(",")[i];
            String mycode = bbvo.getMycode().split(",")[i];

            int totalDcPrice = Integer.parseInt(dcPrice) * Integer.parseInt(purchase);
            allproductprice = allproductprice + totalDcPrice;

            buyBindVO b = new buyBindVO(eno,fnames,brand, title,shipPay,purchase, discount, dcPrice, ogPrice, mycode);

            bbvos.add(b);
        }

        int totalprice = allproductprice + allshipPay;

        mv.addObject("allproductprice",allproductprice);
        mv.addObject("allshipPay",allshipPay);
        mv.addObject("totalprice",totalprice);
        mv.addObject("mvo",mvo);
        mv.addObject("bbvos",bbvos);
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
    public ModelAndView buyOK(ModelAndView mv, HttpSession sess){
        mv.setViewName("buylist/buyOK.tiles");
        String UID = (String) sess.getAttribute("UID");
        mv.addObject("UID",UID);
        return mv;
    }
}
