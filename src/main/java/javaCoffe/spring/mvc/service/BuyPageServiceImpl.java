package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.BuyPageDAO;
import javaCoffe.spring.mvc.vo.EshopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;


@Service("buysrv")
public class BuyPageServiceImpl implements BuyPageService{

    @Autowired
    private BuyPageDAO buydao;

    @Override
    public EshopVO readMD(String code) {
        return buydao.selectMD(code);
    }

    @Override
    public void saveBuyData(String userid, String code, int salesCnt, int finalPrice) {
        Map<String,Object> param = new HashMap<>();
        param.put("userid",userid);
        param.put("code",code);
        param.put("salesCnt",salesCnt);
        param.put("finalPrice",finalPrice);
        buydao.saveBuyData(param);
    }
}
