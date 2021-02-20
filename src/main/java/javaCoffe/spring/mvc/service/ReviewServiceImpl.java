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

    @Override
    public Boolean delReview(ReviewVO nrvo) {
        imgutil.delFile(nrvo.getFnames());
        imgutil.delsumFile(nrvo.getFnames(), nrvo.getRno());
        rdao.deleteView(nrvo.getRno()); //rno값을 넘겨서 데이터베이스에서 삭제하기
        return true;
    }

    @Override
    public Boolean updateReview(ReviewVO rvo, MultipartFile[] img, String[] fileck) {
        ReviewVO ogVo = rdao.selectOneReview(rvo.getRno());
        String ogFnames = ogVo.getFnames(); // 원래의 파일이름들
        String ogFsizes = ogVo.getFsizes(); // 원래의 파일사이즈들
        String[] ogFnamesList = ogFnames.split("[/]");
        String ogFnamesListForSum = ogFnames.split("[/]")[0];
//        for (int i=0; i<ogFnamesList.length; i++){
//            if (ogFnamesList[i] != "-"){ // -가 아닐경우에만 uuid값을 뺀다.
//                ogFnamesList[i] = ogFnamesList[i].substring(ogFnamesList[i].indexOf("_")+1);
//            }
//        }
        String[] ogFsizesList = ogFsizes.split("[/]");
        String fnames = "";
        String fsizes = "";

        if (imgutil.checkGalleryFiles(img)){
            //업로드한 이미지명을 저장하는 동적 배열 생성
            List<String> imgs = new ArrayList<>();
            //첨부파일이 존재한다면 서버에 저장하고, 파일이름을 받아와서 동적 배열에 저장
            int i = 0; // 순서 체크를 위한 i선언
            for (MultipartFile f : img){
                if (i==0){ //i가 0일때는 썸네일체크를 위해 별도로 로직을 분리
                    if (!f.getOriginalFilename().isEmpty()){ //넘어온 파일이 존재한다면 파일을 저장하고 동적배열에 추가하며, 썸네일로만들고, 기존썸네일은 삭제한다.
                    //0번째는 무조건 이미지파일이 존재하므로, 기존이미지파일은 삭제하고, 썸네일도 삭제한다.
                        imgutil.delOneFile(ogFnamesListForSum); //기존 이미지파일 삭제
                        imgutil.delOneSumFile(ogFnamesListForSum, rvo.getRno()); //썸네일 삭제
                        imgs.add(imgutil.ImageUpload(f)); // f값을 넘겨서 이미지를 등록하고 받은 name/size를 동적배열에 추가
                        String firstImg = imgs.get(0).split("[/]")[0]; //imgs의 첫번째에 위치한 파일이름을 가져온다.
                        imgutil.imageCropResize(firstImg, rvo.getRno()); // 섬네일 생성
                    }else { //넘어온 파일이 존재하지 않는다면 기존에 있던 파일이름과 사이즈를 동적배열에 추가하고 넘어간다.
                        String fnfs = ogFnamesList[i] + "/" + ogFsizesList[i];
                        imgs.add(fnfs);
                    }

                }else { //i가 0이 아닐때는 아래의 로직 수행
                    if (!f.getOriginalFilename().isEmpty()) { //넘어온 파일이 존재한다면 파일을 저장하고 동적배열에 추가
                        //이때 기존파일이 존재한다면 해당 파일을 nginx에서 삭제한다.
                        if (ogFnamesList[i] != "-") {
                            imgutil.delOneFile(ogFnamesList[i]);
                        }
                        imgs.add(imgutil.ImageUpload(f));
                    } else { // 넘어온 파일이 없다면, 기존에 있던 파일이름과 사이즈를 추가
                        if (fileck[i].equals("true")) { // 업로드할 이미지파일을 선택하세요i가 아닐때, 즉 실제로 변동사항이 없을때
                            String fnfs = ogFnamesList[i] + "/" + ogFsizesList[i];
                            imgs.add(fnfs);
                        } else { // 기존 파일을 삭제요청했을때
                            imgutil.delOneFile(ogFnamesList[i]);
                            imgs.add("-/-");
                        }
                    }
                }
                i++; //i의 값 증가시키기
            }
            // 정리가 완료된 imgs배열의 값을 rvo에 담기
            for(int j = 0; j< imgs.size(); ++j){
                fnames += imgs.get(j).split("[/]")[0] + "/";
                fsizes += imgs.get(j).split("[/]")[1] + "/";
            }
            rvo.setFnames(fnames);
            rvo.setFsizes(fsizes);

        }else {// 첨부파일이 수정되지 않았다면 기존대로 저장
            rvo.setFnames(ogFnames);
            rvo.setFsizes(ogFsizes);
        }
        rdao.updateReview(rvo);
        return true;
    }


}
