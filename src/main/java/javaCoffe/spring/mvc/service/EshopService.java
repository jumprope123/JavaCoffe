package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.EshopVO;

import java.util.List;

public interface EshopService {
    List<EshopVO> readCoffeInfo(String bigGenre, String cp);

    int countBigGenre(String bigGenre);

    List<EshopVO> readCoffeInfoByThumbs(String bigGenre, String cp);

    List<EshopVO> readCoffeInfoByThumbs(String bigGenre, String cp, String smallGenre);

    int countBigGenre(String bigGenre, String smallGenre);
}
