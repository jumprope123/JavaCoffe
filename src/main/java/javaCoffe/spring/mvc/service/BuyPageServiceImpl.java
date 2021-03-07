package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.BuyPageDAO;
import javaCoffe.spring.mvc.vo.EshopVO;
import javaCoffe.spring.mvc.vo.MemberVO;
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
    public MemberVO readUser(String userid) {return buydao.selectUser(userid);}


}
