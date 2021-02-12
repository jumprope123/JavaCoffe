package javaCoffe.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReviewController {


    @GetMapping("/review/write")
    public String review(){
        return "review/write.tiles";
    }


}
