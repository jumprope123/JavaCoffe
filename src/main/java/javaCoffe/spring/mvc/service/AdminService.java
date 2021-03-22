package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.BuyPageBindVO;
import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface AdminService {
    boolean newProduct(EshopVO evo, MultipartFile[] img);

    List<BuyPageVO> readBuyData(String cp);

    List<BuyPageBindVO> readBuyBindData(String cp);

    void processModi(int buyno, String process);

    void processBindModi(int buyno, String process);

    int countData();

    boolean remove_eshop(int eno);

    int countBindData();

    List<BuyPageVO> readBuyData(String cp, String adminSearchTxt);

    List<BuyPageBindVO> readBuyBindData(String cp, String adminSearchTxt);

    int countData(String adminSearchTxt);

    int countBindData(String adminSearchTxt);

}
