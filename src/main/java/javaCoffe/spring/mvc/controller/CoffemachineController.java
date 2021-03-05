package javaCoffe.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CoffemachineController {

    @GetMapping("/coffemachine/view")
    public String coffemachine() {
        return "coffemachine/view.tiles";
    }

}
