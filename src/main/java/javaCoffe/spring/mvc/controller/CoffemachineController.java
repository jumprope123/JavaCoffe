package javaCoffe.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CoffemachineController {

    @GetMapping("/coffemachine/view1")
    public String coffemachine() {
        return "coffemachine/view1.tiles";
    }

    @GetMapping("/coffemachine/view2")
    public String coffebean() { return "coffemachine/view2.tiles"; }

    @GetMapping("/coffemachine/view3")
    public String coffebean2() { return "coffemachine/view3.tiles"; }

}
