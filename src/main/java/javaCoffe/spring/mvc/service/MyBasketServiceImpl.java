package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.MyBasketDAO;
import javaCoffe.spring.mvc.vo.MyBasketVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("mbsrv")
public class MyBasketServiceImpl implements MyBasketService{

    @Autowired
    private MyBasketDAO mbdao;

    @Override
    public List<MyBasketVO> readProduct(String userid) {
        return mbdao.selectmb(userid);
    }

//    @Override
//    public MyBasketVO readOneMB(String code, Object userid, int salesCnt) {
//        Map<String, Object> param = new HashMap<>();
//        param.put("code",code);
//        param.put("userid",userid);
//        param.put("salesCnt",salesCnt);
//        return mbdao.selectOnemb(param);
//    }

//    @Override
//    public boolean newMBProduct(MyBasketVO mbvo) {
//        boolean result = false;
//        int cnt = mbdao.insertmb(mbvo);
//        if (cnt > 0) return result;
//        return result;
//    }

    @Override
    public boolean removemb(String mbno) {

        return false;
    }

    @Override
    public boolean newMBProduct(String mbcode, Object userid, int mbamount) {
        boolean result = false;
        Map<String, Object> param = new HashMap<>();
        param.put("code",mbcode);
        param.put("userid",userid);
        param.put("mbamount",mbamount);
        int cnt = mbdao.insertmb(param);
        if (cnt > 0) return result;
        return result;
    }

}
