package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.BuyPageDAO;
import javaCoffe.spring.mvc.vo.BuyPageVO;
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

    @Override
    public int insertData(BuyPageVO buyvo) {return buydao.insertData(buyvo);}

    @Override
    public int changePoint(BuyPageVO buyvo) {
        int ogpoints = buyvo.getBeforePoint();
        int buyPageUsePoints = buyvo.getBuyPageUsePoints();
        int plusPoint = buyvo.getPlusPoint();
        int finalPoint = ogpoints - buyPageUsePoints + plusPoint;
        String userid = buyvo.getUserid();
        Map<String,Object> map = new HashMap<>();
        map.put("userid",userid);
        map.put("points",finalPoint);
        return buydao.changePoints(map);
    }


}
