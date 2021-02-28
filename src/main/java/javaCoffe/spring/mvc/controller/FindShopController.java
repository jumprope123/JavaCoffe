package javaCoffe.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FindShopController {

    @GetMapping("/findshop/first")
    public String first(){
        return "findshop/first.tiles";
    }

}
