package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.dao.FindShopDAO;
import javaCoffe.spring.mvc.service.FindShopService;
import javaCoffe.spring.mvc.vo.FindShopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

@Controller
public class FindShopController {

    @Autowired private FindShopService fsrv;


    @GetMapping("/findshop/first")
    public ModelAndView findresult(ModelAndView mv){
        mv.setViewName("findshop/first.tiles");
        mv.addObject("fsinfo", fsrv.readFindShop());
        mv.addObject("location",fsrv.readLocation());
        fsrv.readLocationjson();

        return mv;
    }



}
