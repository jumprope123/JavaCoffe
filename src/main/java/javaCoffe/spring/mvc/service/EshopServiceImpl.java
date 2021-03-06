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
    public List<EshopVO> readCoffeInfo(String bigGenre, String cp, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("cntNum",cntNum);
        return edao.CoffeInfo(param);
    }

    @Override
    public List<EshopVO> readCoffeInfo(String bigGenre, String cp, int cntNum, String smallGenre) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("cntNum",cntNum);
        param.put("smallGenre",smallGenre);
        return edao.CoffeInfoWithSmallGenre(param);
    }

    @Override
    public int countBigGenre(String bigGenre) { // 대분류를 통해 총 갯수 파악
        return edao.selectCountBigGenre(bigGenre);
    }

    @Override
    public List<EshopVO> readCoffeInfoByThumbs(String bigGenre, String cp, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoByThumbs(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByThumbs(String bigGenre, String cp, String smallGenre, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum개의 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("smallGenre", smallGenre);
        param.put("cntNum",cntNum);
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
    public List<EshopVO> readCoffeInfoBySalesVolumn(String bigGenre, String cp, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoBySalesVolumn(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoBySalesVolumn(String bigGenre, String cp, String smallGenre, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("smallGenre", smallGenre);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoBySalesVolumnWithSmallGenre(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByCheap(String bigGenre, String cp, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoByCheap(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByCheap(String bigGenre, String cp, String smallGenre, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("smallGenre", smallGenre);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoByCheapWithSmallGenre(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByExpensive(String bigGenre, String cp, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoByExpensive(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByExpensive(String bigGenre, String cp, String smallGenre, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("smallGenre", smallGenre);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoByExpensiveWithSmallGenre(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByComment(String bigGenre, String cp, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoByComment(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByComment(String bigGenre, String cp, String smallGenre, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("smallGenre", smallGenre);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoByCommentWithSmallGenre(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByRegdate(String bigGenre, String cp, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoByRegdate(param);
    }

    @Override
    public List<EshopVO> readCoffeInfoByRegdate(String bigGenre, String cp, String smallGenre, int cntNum) {
        int snum = (Integer.parseInt(cp) - 1) * cntNum; //한페이지에 cntNum 리스트를 보여줌
        Map<String,Object> param = new HashMap<>();
        param.put("bigGenre", bigGenre);
        param.put("snum",snum);
        param.put("smallGenre", smallGenre);
        param.put("cntNum",cntNum);
        return edao.CoffeInfoByRegdateWithSmallGenre(param);
    }

    @Override
    public EshopVO readMDData(String eno) {
        return edao.readOneMDData(eno);
    }
}
