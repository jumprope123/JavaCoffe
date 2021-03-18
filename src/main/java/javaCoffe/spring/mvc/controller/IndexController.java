package javaCoffe.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class IndexController {

    @GetMapping("/index")
    public String index(){

        return "index.tiles";
    }
}
