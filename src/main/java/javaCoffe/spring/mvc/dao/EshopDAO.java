package javaCoffe.spring.mvc.dao;


import javaCoffe.spring.mvc.vo.EshopVO;

import java.util.List;
import java.util.Map;

public interface EshopDAO {
    List<EshopVO> CoffeInfo(Map<String, Object> param);

    List<EshopVO> CoffeInfoWithSmallGenre(Map<String, Object> param);

    int selectCountBigGenre(String bigGenre);

    List<EshopVO> CoffeInfoByThumbs(Map<String, Object> param);

    List<EshopVO> CoffeInfoByThumbsWithSmallGenre(Map<String, Object> param);

    int selectCountBigGenre(Map<String, Object> param);

    List<EshopVO> CoffeInfoBySalesVolumn(Map<String, Object> param);

    List<EshopVO> CoffeInfoBySalesVolumnWithSmallGenre(Map<String, Object> param);

    List<EshopVO> CoffeInfoByCheap(Map<String, Object> param);

    List<EshopVO> CoffeInfoByCheapWithSmallGenre(Map<String, Object> param);

    List<EshopVO> CoffeInfoByExpensive(Map<String, Object> param);

    List<EshopVO> CoffeInfoByExpensiveWithSmallGenre(Map<String, Object> param);

    List<EshopVO> CoffeInfoByComment(Map<String, Object> param);

    List<EshopVO> CoffeInfoByCommentWithSmallGenre(Map<String, Object> param);

    List<EshopVO> CoffeInfoByRegdate(Map<String, Object> param);

    List<EshopVO> CoffeInfoByRegdateWithSmallGenre(Map<String, Object> param);

}