package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface AdminService {
    boolean newProduct(EshopVO evo, MultipartFile[] img);

    List<BuyPageVO> readBuyData();
}
