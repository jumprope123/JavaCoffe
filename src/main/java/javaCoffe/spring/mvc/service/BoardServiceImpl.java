package javaCoffe.spring.mvc.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import javaCoffe.spring.mvc.dao.BoardDAO;
import javaCoffe.spring.mvc.utils.FileUpDownUtil;
import javaCoffe.spring.mvc.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("bsrv")
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO bdao;
    @Autowired
    private FileUpDownUtil fud;

    @Override //MultipartFile로 구현된 자료실 소스
    public boolean newBoard(BoardVO bvo, MultipartFile[] file) {
        //파일 업로드시 사용할 UUID 생성
        String uuid = fud.makeUUID();

        //업로드한 파일의 정보를 저장하기 위해 동적배열 생성
        List<String> files = new ArrayList<>();

        for(MultipartFile f : file){
            if(!f.getOriginalFilename().isEmpty())
                files.add(fud.proUpload2(f, uuid));
                //파일업로드시 앞서 만든 uuid값을 매개변수로 넘김
                //업로드한 뒤 결과값은 '파일명/파일크기/파일종류'로 넘어 옴
            else files.add("-/-/-");
            //업로드를 하지 못한경우 '-/-/-'만 넘김
        }

        //업로드한 파일정보와 폼데이터 확인
        /*System.out.println(pvo.getTitle());
        System.out.println(pvo.getContents());
        System.out.println(files.get(0));
        System.out.println(files.get(1));*/

        //업로드한 파일정보를 vo로 나눠 저장
        bvo.setFname1(files.get(0).split("[/]")[0]);
        bvo.setFsize1(files.get(0).split("[/]")[1]);
        bvo.setFtype1(files.get(0).split("[/]")[2]);

        bvo.setFname2(files.get(1).split("[/]")[0]);
        bvo.setFsize2(files.get(1).split("[/]")[1]);
        bvo.setFtype2(files.get(1).split("[/]")[2]);

        bvo.setFname3(files.get(2).split("[/]")[0]);
        bvo.setFsize3(files.get(2).split("[/]")[1]);
        bvo.setFtype3(files.get(2).split("[/]")[2]);

        //위에서 생성한 uuid를 pvo에 저장
        bvo.setUuid(uuid);

        //테이블에 입력데이터 저장
        int cn = bdao.insertBoard(bvo);

        return true;
    }

    @Override //리스트보기
    public List<BoardVO> readBoard(String cp) {
        int snum = (Integer.parseInt(cp) -1 ) * 10;

        return bdao.selectBoard(snum);
    }

    @Override
    public List<BoardVO> readBoard(String cp, String findtype, String findkey) {
        Map<String , Object> param = new HashMap<>();

        int snum = (Integer.parseInt(cp) - 1) * 10;
        param.put("snum", snum);
        param.put("findType", findtype);
        param.put("findKey", findkey);
        return bdao.findSelectList(param);
    }

    @Override
    public BoardVO readOneFname(String bno, String order) {
        return bdao.selectOneFname(bno, order);
    }

    @Override //본문보기
    public BoardVO readOneBoard(String bno) {
        return bdao.selectOneBoard(bno);
    }

    @Override //수정하기
    public boolean modifyBoard(BoardVO bvo) {
        boolean isOk = false;
        int cnt = bdao.updateBoard(bvo);
        if(cnt>0) isOk = true;

        return isOk;
    }

    @Override //삭제하기
    public boolean removeBoard(String bno) {
        boolean isOk = false;
        int cnt = bdao.deleteBoard(bno);
        if(cnt>0) isOk = true;

        return isOk;
    }

    //게시글 총 갯수
    public int countBoard() {
        return bdao.selectCountBoard();
    }

    @Override
    public int countBoard(String findtype, String findkey) {
        Map<String , String> param = new HashMap<>();

        param.put("findType", findtype);
        param.put("findKey", findkey);

        return bdao.selectCountBoard(param);
    }

    @Override //조회수 증가
    public boolean viewCountBoard(String bno) {
        boolean isOK = false;
        int cnt = bdao.updateViewCount(bno);
        if(cnt>0) isOK = true;

        return isOK;
    }

    //추천하기
    @Override
    public String updateThumb(String bno, String checkThumb) {
        if (checkThumb.equals("yes")) {
            bdao.updateThumbPluBoard(bno);
        }else {
            bdao.updateThumbMinBoard(bno);
        }
        ObjectMapper mapper = new ObjectMapper();
        String json = "";
        try {
            json = mapper.writeValueAsString(bdao.selectOneThumb(bno));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public String readPreBoard(String bno) { return bdao.selectPreBno(bno); }

    @Override
    public String readNextBoard(String bno) {
        return bdao.selectNextBno(bno);
    }

    @Override
    public String readFirstBno() { return bdao.selectFirstBno(); }

    @Override
    public String readLastBno() {
        return bdao.selectLastBno();
    }

    @Override
    public boolean downCountBoard(String bno, String order) {
        Map<String , String> param = new HashMap<>();
        param.put("bno",bno);
        param.put("order", "fdown" + order);
        int cnt = bdao.updateDownCount(param);
        return true;
    }


    private void procFordata(BoardVO p, Map<String, String> frmdata) {
        for(String key: frmdata.keySet()){ //Map데이터로부터 키를 하나씩 꺼냄
            String val = frmdata.get(key); //키에 해당하는 값을 알아냄
            switch (key){
                case "uuid":p.setUuid(val); break;
                case "title":p.setTitle(val); break;
                case "userid":p.setUserid(val); break;
                case "contents":p.setContents(val); break;
                case "file1":p.setFname1(val); break;
                case "file1size":p.setFsize1(val); break;
                case "file1type":p.setFtype1(val); break;
                case "file2":p.setFname2(val); break;
                case "file2size":p.setFsize2(val); break;
                case "file2type":p.setFtype2(val); break;
                case "file3":p.setFname3(val); break;
                case "file3size":p.setFsize3(val); break;
                case "file3type":p.setFtype3(val); break;
            }
        }
    }


}
