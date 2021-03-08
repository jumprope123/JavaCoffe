package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.MyBasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyBasketController {

    @Autowired private MyBasketService mbsrv;

    @GetMapping("/mybasket/list")
    public String list(){
        return "/mybasket/list.tiles";
    }

}
