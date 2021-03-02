package javaCoffe.spring.mvc.controller;

import javaCoffe.spring.mvc.service.EshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class EshopController {

    @Autowired
    private EshopService esrv;

    @GetMapping("/eshop/list")
    public ModelAndView list(ModelAndView mv, String cp, String bigGenre){
        mv.setViewName("eshop/list.tiles");

        mv.addObject("bigGenres",esrv.readCoffeInfo(bigGenre,cp)); // cp값에따라 20개의 데이터를 넘김
        mv.addObject("bigGenreCnt",esrv.countBigGenre(bigGenre)); // 해당 대분류값의 총 갯수를 파악함

        return mv;
    }

    @GetMapping("/eshop/listByThumbs") //추천순이 눌렷을때 bigGenre와 smallGenre(없을때도잇음)를 가지고 db에서 다르게 읽어온다
    public ModelAndView listByThumbs(ModelAndView mv, String cp, String bigGenre, String smallGenre){
        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()){ //smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByThumbs(bigGenre,cp)); // cp값에따라 20개의 데이터를 넘김 단, thumbs에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        } else { // smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByThumbs(bigGenre,cp,smallGenre)); // cp값에따라 20개의 데이터를 넘김 단, thumbs에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre,smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        return mv;
    }

    @GetMapping("eshop/listBySalesVolumn")
    public ModelAndView listBySalesVolumn(ModelAndView mv, String cp , String bigGenre, String smallGenre){
        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()){ // smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoBySalesVolumn(bigGenre,cp)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt",esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        }else {// smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoBySalesVolumn(bigGenre,cp,smallGenre)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt",esrv.countBigGenre(bigGenre,smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        return mv;
    }

    @GetMapping("eshop/listByCheap") //할인후 가격 기준 오름차순 정렬
    public ModelAndView listByCheap(ModelAndView mv, String cp, String bigGenre, String smallGenre) {
        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()) { // smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByCheap(bigGenre, cp)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        } else {// smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByCheap(bigGenre, cp, smallGenre)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre, smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        return mv;
    }

    @GetMapping("eshop/listByExpensive")
    public ModelAndView listByExpensive(ModelAndView mv, String cp, String bigGenre, String smallGenre){
        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()) { // smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByExpensive(bigGenre, cp)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        } else {// smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByExpensive(bigGenre, cp, smallGenre)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre, smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        return mv;
    }

    @GetMapping("eshop/listByComment")
    public ModelAndView listByComment(ModelAndView mv, String cp, String bigGenre, String smallGenre){
        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()) { // smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByComment(bigGenre, cp)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        } else {// smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByComment(bigGenre, cp, smallGenre)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre, smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        return mv;
    }


}
