package javaCoffe.spring.mvc.service;

import javaCoffe.spring.mvc.vo.BoardVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface BoardService {
    boolean newBoard(BoardVO bvo, MultipartFile[] file);
    //boolean newBoard(BoardVO bvo);
    List<BoardVO> readBoard(String cp);
    List<BoardVO> readBoard(String cp, String findtype, String findkey);

    BoardVO readOneFname(String bno, String order);

    BoardVO readOneBoard(String bno);
    boolean modifyBoard(BoardVO bvo);
    boolean removeBoard(String bno);
    int countBoard();
    int countBoard(String findtype, String findkey);

    boolean viewCountBoard(String bno);

    boolean downCountBoard(String bno, String order);
}
