package javaCoffe.spring.mvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CoAndMaController {

    @GetMapping("/CoffeeAndMachine/navi")
    public ModelAndView navi(ModelAndView mv, String kof){


        mv.setViewName("CoffeeAndMachine/navi.tiles");


        return mv;
    }


    @GetMapping("/CoffeeAndMachine/researchForm")
    public ModelAndView researchForm(ModelAndView mv, String kof){


        mv.setViewName("CoffeeAndMachine/researchForm");


        return mv;
    }


    @GetMapping("/CoffeeAndMachine/researchForm2")
    public ModelAndView researchForm2(ModelAndView mv, String kof){


        mv.setViewName("CoffeeAndMachine/researchForm2");


        return mv;
    }


    @GetMapping("CoffeeAndMachine/view2")
    public ModelAndView description1(ModelAndView mv, String kof){


        mv.setViewName("CoffeeAndMachine/view2");


        return mv;
    }
    @GetMapping("CoffeeAndMachine/view1")
    public ModelAndView description2(ModelAndView mv, String kof){


        mv.setViewName("CoffeeAndMachine/view1");


        return mv;
    }


    @GetMapping("/CoffeeAndMachine/researchPrint")
    public ModelAndView researchPrint(ModelAndView mv, String kof){


        mv.setViewName("CoffeeAndMachine/researchPrint");


        return mv;
    }

    @GetMapping("/CoffeeAndMachine/researchPrint2")
    public ModelAndView researchPrint2(ModelAndView mv, String kof){


        mv.setViewName("CoffeeAndMachine/researchPrint2");


        return mv;
    }

    @GetMapping("/CoffeeAndMachine/intro")
    public ModelAndView intro(ModelAndView mv, String kof){


        mv.setViewName("CoffeeAndMachine/intro");


        return mv;
    }



}


