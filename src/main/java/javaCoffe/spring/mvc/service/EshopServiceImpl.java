package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.EshopDAO;
import javaCoffe.spring.mvc.vo.EshopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("esrv")
public class EshopServiceImpl implements EshopService {

    @Autowired
    private EshopDAO edao;

    @Override
    public List<EshopVO> readCoffeInfo(String bigGenre, String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 20; //한페이지에 20개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        return edao.CoffeInfo(param);
    }

    @Override
    public int countBigGenre(String bigGenre) { // 대분류를 통해 총 갯수 파악
        return edao.selectCountBigGenre(bigGenre);
    }

    @Override
    public List<EshopVO> readCoffeInfoByThumbs(String bigGenre, String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 20; //한페이지에 20개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        return edao.CoffeInfoByThumbs(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByThumbs(String bigGenre, String cp, String smallGenre) {
        int snum = (Integer.parseInt(cp) - 1) * 20; //한페이지에 20개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("smallGenre", smallGenre);
        return edao.CoffeInfoByThumbsWithSmallGenre(param);
    }

    @Override
    public int countBigGenre(String bigGenre, String smallGenre) {
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("smallGenre", smallGenre);
        return edao.selectCountBigGenre(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoBySalesVolumn(String bigGenre, String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 20; //한페이지에 20개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        return edao.CoffeInfoBySalesVolumn(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoBySalesVolumn(String bigGenre, String cp, String smallGenre) {
        int snum = (Integer.parseInt(cp) - 1) * 20; //한페이지에 20개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("smallGenre", smallGenre);
        return edao.CoffeInfoBySalesVolumnWithSmallGenre(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByCheap(String bigGenre, String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 20; //한페이지에 20개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        return edao.CoffeInfoByCheap(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByCheap(String bigGenre, String cp, String smallGenre) {
        int snum = (Integer.parseInt(cp) - 1) * 20; //한페이지에 20개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("smallGenre", smallGenre);
        return edao.CoffeInfoByCheapWithSmallGenre(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByExpensive(String bigGenre, String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 20; //한페이지에 20개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        return edao.CoffeInfoByExpensive(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByExpensive(String bigGenre, String cp, String smallGenre) {
        int snum = (Integer.parseInt(cp) - 1) * 20; //한페이지에 20개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("smallGenre", smallGenre);
        return edao.CoffeInfoByExpensiveWithSmallGenre(param);
    }
}
