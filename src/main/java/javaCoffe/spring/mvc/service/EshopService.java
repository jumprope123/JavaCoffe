package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.EshopVO;

import java.util.List;

public interface EshopService {
    List<EshopVO> readCoffeInfo(String bigGenre, String cp);

    int countBigGenre(String bigGenre);
}
