package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.AdminService;
import javaCoffe.spring.mvc.vo.EshopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adsrv;

    @GetMapping("/admin/write")
    public ModelAndView write(ModelAndView mv ,HttpSession sess){
        mv.setViewName("admin/write.tiles");
        String UID = (String) sess.getAttribute("UID");
        mv.addObject("UID",UID);
        return mv;
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
    public ModelAndView handler(ModelAndView mv, String cp, HttpSession sess){
        if (cp == null || cp.isEmpty()) {cp = "1";}
        mv.setViewName("admin/handle.tiles");
        String UID = (String) sess.getAttribute("UID");
        mv.addObject("UID",UID);
        mv.addObject("data" , adsrv.readBuyData(cp)); //30개씩 뽑아서 넘김
        mv.addObject("dataCnt",adsrv.countData());
        return mv;
    }

    @GetMapping("/admin/find")
    public ModelAndView find(ModelAndView mv, String cp , String adminSearchTxt){
        if (cp == null || cp.isEmpty()) {
            cp = "1";
        }
        switch (adminSearchTxt){
            case "1" : adminSearchTxt = "배송준비중"; break;
            case "2" : adminSearchTxt = "배송중"; break;
            case "3" : adminSearchTxt = "배송완료"; break;
            case "4" : adminSearchTxt = "반품요청"; break;
            default: adminSearchTxt = "반품"; break;
        }

        mv.setViewName("admin/handle.tiles");
        mv.addObject("data" , adsrv.readBuyData(cp, adminSearchTxt)); //30개씩 뽑아서 넘김
        mv.addObject("dataCnt",adsrv.countData(adminSearchTxt));
        return mv;
    }

    @ResponseBody
    @GetMapping("/admin/processModify")
    public void processModify(int buyno, String process){
        adsrv.processModi(buyno,process);
    }
}
