package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.BuyPageService;
import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;
import javaCoffe.spring.mvc.vo.MemberVO;
import javaCoffe.spring.mvc.vo.MyBasket_EshopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

@Controller
public class BuyPageController {

    @Autowired
    private BuyPageService buysrv;

    // 상품상세페이지 -> 구매페이지
    @PostMapping("/buylist/buyPage")
    public ModelAndView buyPage(ModelAndView mv, HttpServletRequest req, String userid){
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
    @RequestMapping(value="/buylist/mb_buyPage" , method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView mb_buyPage(ModelAndView mv, HttpServletRequest req, HttpSession sess){
        mv.setViewName("buylist/mb_buyPage.tiles");

        String mbno = req.getParameter("mbno");
        System.out.println(mbno);


        if(mbno!=null) {
            String[] lmbno = (mbno.split(","));
            int[] int_lmbno = Arrays.stream(lmbno).mapToInt(Integer::parseInt).toArray();
            System.out.println("---------");
            for (int i : int_lmbno) {
                System.out.println(i);
            }
            System.out.println("---------");
            List<MyBasket_EshopVO> mbevo = buysrv.readMBEL(int_lmbno); //넘겨받은 장바구니 번호를 통해 상품정보 읽어오기
            mv.addObject("mbevo",mbevo);
        }

        String totalprice = req.getParameter("totalprice");
        System.out.println(totalprice);
        String allproductprice = req.getParameter("allproductprice");
        System.out.println(allproductprice);
        String allshipPay = req.getParameter("allshipPay");
        System.out.println(allshipPay);
        String userid = (String) sess.getAttribute("UID");
        MemberVO mvo = buysrv.readUser(userid); // userid를 이용해 Member의 정보 뽑아옴


        mv.addObject("mvo",mvo);
        mv.addObject("totalprice",totalprice);
        mv.addObject("allproductprice",allproductprice);
        mv.addObject("allshipPay",allshipPay);
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
