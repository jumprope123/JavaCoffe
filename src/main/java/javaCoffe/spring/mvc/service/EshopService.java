package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.EshopVO;

import java.util.List;

public interface EshopService {
    List<EshopVO> readCoffeInfo(String bigGenre, String cp, int cntNum);

    List<EshopVO> readCoffeInfo(String bigGenre, String cp, int cntNum, String smallGenre);

    int countBigGenre(String bigGenre);

    List<EshopVO> readCoffeInfoByThumbs(String bigGenre, String cp, int cntNum);

    List<EshopVO> readCoffeInfoByThumbs(String bigGenre, String cp, String smallGenre, int cntNum);

    int countBigGenre(String bigGenre, String smallGenre);

    List<EshopVO> readCoffeInfoBySalesVolumn(String bigGenre, String cp, int cntNum);

    List<EshopVO> readCoffeInfoBySalesVolumn(String bigGenre, String cp, String smallGenre, int cntNum);

    List<EshopVO> readCoffeInfoByCheap(String bigGenre, String cp, int cntNum);

    List<EshopVO> readCoffeInfoByCheap(String bigGenre, String cp, String smallGenre, int cntNum);

    List<EshopVO> readCoffeInfoByExpensive(String bigGenre, String cp, int cntNum);

    List<EshopVO> readCoffeInfoByExpensive(String bigGenre, String cp, String smallGenre, int cntNum);

    List<EshopVO> readCoffeInfoByComment(String bigGenre, String cp, int cntNum);

    List<EshopVO> readCoffeInfoByComment(String bigGenre, String cp, String smallGenre, int cntNum);

    List<EshopVO> readCoffeInfoByRegdate(String bigGenre, String cp, int cntNum);

    List<EshopVO> readCoffeInfoByRegdate(String bigGenre, String cp, String smallGenre, int cntNum);

}
