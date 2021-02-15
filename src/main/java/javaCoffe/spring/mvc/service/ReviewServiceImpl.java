package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.dao.ReviewDAO;
import javaCoffe.spring.mvc.utils.ImageUploadUtil;
import javaCoffe.spring.mvc.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("rsrv")
public class ReviewServiceImpl implements ReviewService{

    @Autowired
    private ReviewDAO rdao;
    @Autowired
    private ImageUploadUtil imgutil;


    @Override
    public Boolean newReview(ReviewVO rvo, MultipartFile[] img) {

        //첨부파일이 존재한다면
        if (imgutil.checkGalleryFiles(img)){
            //업로드 한 이미지명을 저장하는 동적배열 생성
            List<String> imgs = new ArrayList<>();
            //첨부파일이 존재한다면 서버에 저장하고, 파일이름을 받아서 동적배열에 저장
            for (MultipartFile f : img){
                if (!f.getOriginalFilename().isEmpty()){
                    imgs.add(imgutil.ImageUpload(f));
                }else {
                    // 업로드할 이미지가 없으면 -,-를 동적배열에 저장
                    imgs.add("-/-");
                }
            }
            String fnames = "";
            String fsizes = "";

            for (int i = 0; i < imgs.size(); ++i){
                fnames += imgs.get(i).split("[/]")[0] + "/";
                fsizes += imgs.get(i).split("[/]")[1] + "/";
            }
            rvo.setFnames(fnames);
            rvo.setFsizes(fsizes);
        }

        //업로드할 이미지 정보를 테이블에 저장
        String id = rdao.insertReview(rvo);

        // 업로드 한 이미지중 첫번째 이미지를 썸네일로 지정
        imgutil.imageCropResize(rvo.getFnames().split("[/]")[0],id);

        return true;
    }

    @Override
    public List<ReviewVO> readReview(String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 24;
        return rdao.selectReview(snum);
    }

    @Override
    public int countReview() {
        return rdao.selectCountReview();
    }

    @Override
    public List<ReviewVO> readReview(String cp, String findtype, String findkey) {
        Map<String, Object> param = new HashMap<>();
        int snum = (Integer.parseInt(cp) - 1) * 24;
        param.put("snum",snum);
        param.put("findType",findtype);
        param.put("findKey",findkey);
        return rdao.findSelectList(param);
    }

    @Override
    public int countReview(String findtype, String findkey) {
        Map<String,String> param = new HashMap<>();

        param.put("findType", findtype);
        param.put("findKey", findkey);
        return rdao.selectCountReview(param);

    }

    @Override
    public ReviewVO readOneReview(String rno) {
        return rdao.selectOneReview(rno);
    }

    @Override
    public Boolean viewCountReview(String rno) {
        Boolean isOK = false;
        int cnt = rdao.updateViewCount(rno);
        if (cnt>0) isOK = true;
        return isOK;
    }
}
