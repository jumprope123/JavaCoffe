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
}
