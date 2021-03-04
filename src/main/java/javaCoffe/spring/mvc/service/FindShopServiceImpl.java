package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.FindShopDAO;
import javaCoffe.spring.mvc.vo.FindShopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("fsrv")
public class FindShopServiceImpl implements FindShopService{
    @Autowired private FindShopDAO fdao;

    @Override
    public List<FindShopVO> readLocation() {
        return fdao.selectLocation();
    }

    @Override
    public List<FindShopVO> readFindShop() {
        return fdao.selectList();
    }
}
