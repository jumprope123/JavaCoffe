package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.AdminDAO;
import javaCoffe.spring.mvc.utils.ImageUploadUtilForAdmin;
import javaCoffe.spring.mvc.vo.BuyPageBindVO;
import javaCoffe.spring.mvc.vo.BuyPageVO;
import javaCoffe.spring.mvc.vo.EshopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public List<BuyPageVO> readBuyData(String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 30;
        return adao.readAllData(snum);
    }

    @Override
    public List<BuyPageBindVO> readBuyBindData(String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 30;
        return adao.readAllBindData(snum);
    }

    @Override
    public void processModi(int buyno, String process) {
        Map<String,Object> map = new HashMap<>();
        map.put("buyno",buyno);
        map.put("process",process);
        adao.processModify(map);
    }

    @Override
    public void processBindModi(int buyno, String process) {
        Map<String,Object> map = new HashMap<>();
        map.put("buyno",buyno);
        map.put("process",process);
        adao.processBindModify(map);
    }

    @Override
    public int countData() {
        return adao.countData();
    }

    @Override
    public int countBindData() {
        return adao.countBindData();
    }

    @Override
    public List<BuyPageVO> readBuyData(String cp, String adminSearchTxt) {
        int snum = (Integer.parseInt(cp) - 1) * 30;
        Map<String,Object> map = new HashMap<>();
        map.put("snum",snum);
        map.put("adminSearchTxt",adminSearchTxt);
        return adao.readAllDataSearch(map);
    }

    @Override
    public List<BuyPageBindVO> readBuyBindData(String cp, String adminSearchTxt) {
        int snum = (Integer.parseInt(cp) - 1) * 30;
        Map<String,Object> map = new HashMap<>();
        map.put("snum",snum);
        map.put("adminSearchTxt",adminSearchTxt);
        return adao.readAllBindDataSearch(map);
    }

    @Override
    public int countData(String adminSearchTxt) {
        return adao.countDataSearch(adminSearchTxt);
    }

    @Override
    public int countBindData(String adminSearchTxt) {
        return adao.countBindDataSearch(adminSearchTxt);
    }

}
