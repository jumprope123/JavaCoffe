package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.EshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EshopController {

    @Autowired
    private EshopService esrv;

    @GetMapping("/eshop/list")
    public String list(){
        return "eshop/list.tiles";
    }
}
