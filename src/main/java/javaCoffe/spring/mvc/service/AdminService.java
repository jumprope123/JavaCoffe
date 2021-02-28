package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.EshopVO;
import org.springframework.web.multipart.MultipartFile;

public interface AdminService {
    boolean newProduct(EshopVO evo, MultipartFile[] img);
}
