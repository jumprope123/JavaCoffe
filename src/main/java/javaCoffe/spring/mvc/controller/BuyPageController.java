package javaCoffe.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BuyPageController {


    @GetMapping("/buylist/buyPage")
    public String buyPage(){ //페이지 제작을 위해 만들어둔 컨트롤러로 삭제예정
        return "buylist/buyPage.tiles";
    }
}
