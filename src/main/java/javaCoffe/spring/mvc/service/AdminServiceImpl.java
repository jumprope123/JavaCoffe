package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.AdminDAO;
import javaCoffe.spring.mvc.utils.ImageUploadUtilForAdmin;
import javaCoffe.spring.mvc.vo.EshopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Service("adsrv")
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminDAO adao;

    @Autowired
    private ImageUploadUtilForAdmin imgutilforAdmin;

    @Override
    public boolean newProduct(EshopVO evo, MultipartFile[] img) {
        if (imgutilforAdmin.checkGalleryFiles(img)) {
            List<String> imgs = new ArrayList<>();
            for (MultipartFile f : img) {
                if (!f.getOriginalFilename().isEmpty()) {
                    imgs.add(imgutilforAdmin.ImageUpload(f));
                } else {
                    imgs.add("-/-");
                }
            }
            String fnames = "";
            String fsizes = "";

            for (int i = 0; i < imgs.size(); ++i) {
                fnames += imgs.get(i).split("[/]")[0] + "/";
                fsizes += imgs.get(i).split("[/]")[1] + "/";
            }
            evo.setFnames(fnames);
            evo.setFsizes(fsizes);
        } else {
            return false;
        }

        String id = adao.insertNewProduct(evo); // 넘겨서 저장
        imgutilforAdmin.imageCropResize(evo.getFnames().split("[/]")[0],id);
        return true;
    }
}
