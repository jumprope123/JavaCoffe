package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.AdminService;
import javaCoffe.spring.mvc.vo.EshopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    @Autowired
    private AdminService adsrv;

    @GetMapping("/admin/write")
    public String write(){
        return "admin/write.tiles";
    }

    @GetMapping("/eshop/fail")
    public String fail(){
        return "eshop/fail.tiles";
    }

    @PostMapping("/admin/writeok")
    public String writeok(EshopVO evo, MultipartFile[] img){
        String returnPage = "redirect:/eshop/fail";
        if (adsrv.newProduct(evo, img) == true){
            returnPage = "redirect:/eshop/list?bigGenre=coffe&cp=1";
        }
        return returnPage;
    }

    @GetMapping("/admin/handle")
    public ModelAndView handler(ModelAndView mv){
        mv.setViewName("/admin/handle.tiles");
        mv.addObject("data" , adsrv.readBuyData());
        return mv;
    }
}
