package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @Autowired
    private AdminService adsrv;

    @GetMapping("/admin/write")
    public String write(){
        return "admin/write.tiles";
    }
}
