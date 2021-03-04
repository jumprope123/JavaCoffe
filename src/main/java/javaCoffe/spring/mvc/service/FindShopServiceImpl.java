package javaCoffe.spring.mvc.service;

import com.fasterxml.jackson.databind.ObjectMapper;
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

    public String readLocationjson() {
        // select가 클릭되면 ajax로 zipcode에 있는 시도를 불러와서 option에 들어감
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(fdao.selectLocation());
            // 검색한 주소데이터를 json형식으로 변환
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return json;
    }
}
