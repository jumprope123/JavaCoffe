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
    public ModelAndView list(ModelAndView mv, String cp, String bigGenre, String cnt, String smallGenre){
        if (cnt == null || cnt.isEmpty()){cnt = "20";} //만약 cnt가 없으면 20을 대입. 애초에 cnt자체가 안넘어오는경우도잇음
        int cntNum = Integer.parseInt(cnt); // cnt값을 숫자로 변환

        mv.setViewName("eshop/list.tiles");

        if (smallGenre == null || smallGenre.isEmpty()) { //small장르 값이 넘어오질않거나 비어있다면
            mv.addObject("bigGenres", esrv.readCoffeInfo(bigGenre, cp, cntNum)); // cp값에따라 20개의 데이터를 넘김
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre)); // 해당 대분류값의 총 갯수를 파악함
        } else { // small장르가 있다면
            mv.addObject("bigGenres", esrv.readCoffeInfo(bigGenre, cp, cntNum, smallGenre)); // cp값에따라 20개의 데이터를 넘김
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre, smallGenre)); // 해당 대분류값의 총 갯수를 파악함
        }
        mv.addObject("addr","list"); // 주소창에 입력될 값 전달
        mv.addObject("cnt",cnt);

        return mv;
    }

    @GetMapping("/eshop/listByThumbs") //추천순이 눌렷을때 bigGenre와 smallGenre(없을때도잇음)를 가지고 db에서 다르게 읽어온다
    public ModelAndView listByThumbs(ModelAndView mv, String cp, String bigGenre, String smallGenre, String cnt){
        if (cnt == null || cnt.isEmpty()){cnt = "20";} //만약 cnt가 없으면 20을 대입. 애초에 cnt자체가 안넘어오는경우도잇음
        int cntNum = Integer.parseInt(cnt); // cnt값을 숫자로 변환

        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()){ //smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByThumbs(bigGenre,cp,cntNum)); // cp값에따라 20개의 데이터를 넘김 단, thumbs에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        } else { // smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByThumbs(bigGenre,cp,smallGenre,cntNum)); // cp값에따라 20개의 데이터를 넘김 단, thumbs에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre,smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        mv.addObject("addr","listByThumbs"); // 주소창에 입력될 값 전달
        mv.addObject("smallGenre",smallGenre); // 주소창에 입력될 값 전달
        mv.addObject("cnt",cnt);
        return mv;
    }

    @GetMapping("eshop/listBySalesVolumn")
    public ModelAndView listBySalesVolumn(ModelAndView mv, String cp , String bigGenre, String smallGenre, String cnt){
        if (cnt == null || cnt.isEmpty()){cnt = "20";} //만약 cnt가 없으면 20을 대입. 애초에 cnt자체가 안넘어오는경우도잇음
        int cntNum = Integer.parseInt(cnt); // cnt값을 숫자로 변환

        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()){ // smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoBySalesVolumn(bigGenre,cp,cntNum)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt",esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        }else {// smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoBySalesVolumn(bigGenre,cp,smallGenre,cntNum)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt",esrv.countBigGenre(bigGenre,smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        mv.addObject("addr","listBySalesVolumn"); // 주소창에 입력될 값 전달
        mv.addObject("smallGenre",smallGenre); // 주소창에 입력될 값 전달
        mv.addObject("cnt",cnt);
        return mv;
    }

    @GetMapping("eshop/listByCheap") //할인후 가격 기준 오름차순 정렬
    public ModelAndView listByCheap(ModelAndView mv, String cp, String bigGenre, String smallGenre, String cnt) {
        if (cnt == null || cnt.isEmpty()){cnt = "20";} //만약 cnt가 없으면 20을 대입. 애초에 cnt자체가 안넘어오는경우도잇음
        int cntNum = Integer.parseInt(cnt); // cnt값을 숫자로 변환

        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()) { // smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByCheap(bigGenre, cp, cntNum)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        } else {// smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByCheap(bigGenre, cp, smallGenre, cntNum)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre, smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        mv.addObject("addr","listByCheap"); // 주소창에 입력될 값 전달
        mv.addObject("smallGenre",smallGenre); // 주소창에 입력될 값 전달
        mv.addObject("cnt",cnt);
        return mv;
    }

    @GetMapping("eshop/listByExpensive")
    public ModelAndView listByExpensive(ModelAndView mv, String cp, String bigGenre, String smallGenre, String cnt){
        if (cnt == null || cnt.isEmpty()){cnt = "20";} //만약 cnt가 없으면 20을 대입. 애초에 cnt자체가 안넘어오는경우도잇음
        int cntNum = Integer.parseInt(cnt); // cnt값을 숫자로 변환

        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()) { // smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByExpensive(bigGenre, cp, cntNum)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        } else {// smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByExpensive(bigGenre, cp, smallGenre, cntNum)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre, smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        mv.addObject("addr","listByExpensive"); // 주소창에 입력될 값 전달
        mv.addObject("smallGenre",smallGenre); // 주소창에 입력될 값 전달
        mv.addObject("cnt",cnt);
        return mv;
    }

    @GetMapping("eshop/listByComment")
    public ModelAndView listByComment(ModelAndView mv, String cp, String bigGenre, String smallGenre, String cnt){
        if (cnt == null || cnt.isEmpty()){cnt = "20";} //만약 cnt가 없으면 20을 대입. 애초에 cnt자체가 안넘어오는경우도잇음
        int cntNum = Integer.parseInt(cnt); // cnt값을 숫자로 변환

        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()) { // smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByComment(bigGenre, cp, cntNum)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        } else {// smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByComment(bigGenre, cp, smallGenre, cntNum)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre, smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        mv.addObject("addr","listByComment"); // 주소창에 입력될 값 전달
        mv.addObject("smallGenre",smallGenre); // 주소창에 입력될 값 전달
        mv.addObject("cnt",cnt);
        return mv;
    }

    @GetMapping("eshop/listByRegdate")
    public ModelAndView listByRegdate(ModelAndView mv, String cp, String bigGenre, String smallGenre, String cnt){
        if (cnt == null || cnt.isEmpty()){cnt = "20";} //만약 cnt가 없으면 20을 대입. 애초에 cnt자체가 안넘어오는경우도잇음
        int cntNum = Integer.parseInt(cnt); // cnt값을 숫자로 변환

        mv.setViewName("eshop/list.tiles");
        if (smallGenre.isEmpty()) { // smallGenre가 비어있는경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByRegdate(bigGenre, cp, cntNum)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre));// 해당 대분류값의 총 갯수를 파악함
        } else {// smallGenre가 비어있지 않은 경우
            mv.addObject("bigGenres", esrv.readCoffeInfoByRegdate(bigGenre, cp, smallGenre, cntNum)); //cp값에따라 20개의 데이터를 넘김 단, SalesVolumn에 의해 내림차순정렬됨
            mv.addObject("bigGenreCnt", esrv.countBigGenre(bigGenre, smallGenre));// 해당 대분류값의 총 갯수를 파악함
        }
        mv.addObject("addr","listByRegdate"); // 주소창에 입력될 값 전달
        mv.addObject("smallGenre",smallGenre); // 주소창에 입력될 값 전달
        mv.addObject("cnt",cnt);
        return mv;
    }

// 여기부터 view
    @GetMapping("eshop/view")
    public ModelAndView view(ModelAndView mv, String eno){
        mv.setViewName("eshop/view.tiles");
        mv.addObject("viewData",esrv.readMDData(eno)); //merchandise data를 읽어옴
        return mv;
    }

}
