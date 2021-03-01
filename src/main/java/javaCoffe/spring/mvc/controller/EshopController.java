package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.EshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class EshopController {

    @Autowired
    private EshopService esrv;

    @GetMapping("/eshop/list")
    public ModelAndView list(ModelAndView mv, String cp, String bigGenre){
        mv.setViewName("eshop/list.tiles");
        if (bigGenre.equals("coffe")){ // 대분류값이 coffe일때
            mv.addObject("bigGenres",esrv.readCoffeInfo(bigGenre,cp)); // cp값에따라 20개의 데이터를 넘김
            mv.addObject("bigGenreCnt",esrv.countBigGenre(bigGenre)); // 해당 대분류값의 총 갯수를 파악함
        }
        return mv;
    }

}
