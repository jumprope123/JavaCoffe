package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.BuyPageService;
import javaCoffe.spring.mvc.vo.EshopVO;
import org.apache.http.HttpRequest;
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
    public ModelAndView buyPage(ModelAndView mv, HttpServletRequest req){
        List<EshopVO> evo = new ArrayList<>();
        mv.setViewName("buylist/buyPage.tiles");
        String code = req.getParameter("eshopViewCode");
        int salesCnt = Integer.parseInt(req.getParameter("eshopViewNum"));
        int priceForResult = Integer.parseInt(req.getParameter("priceForResult"));
        int finalPrice = salesCnt * priceForResult;
        evo.add(buysrv.readMD(code)); //넘겨받은 코드를 통해 상품정보 읽어오기, 다만 List<EshopVO>형태로 만들어야 나중에 장바구니랑 jsp 에서 호환가능
/*변경필수*/String userid = "testUserId"; //이거 변경 필수! session값으로!!
        buysrv.saveBuyData(userid, code, salesCnt, finalPrice); // 구매페이지에서 필요로 하는 데이터를 담은 db에 해당 정보를 넘겨주자.(나중을위해)
//        mv.addObject("evo",evo);
//        mv.addObject("finalPrice",finalPrice);
//        mv.addObject("salesCnt",salesCnt);
        return mv;
    }
}
