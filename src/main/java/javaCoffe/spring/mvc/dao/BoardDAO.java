package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.BoardVO;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
    int insertBoard(BoardVO bvo);
    List<BoardVO> selectBoard(int snum);
    BoardVO selectOneBoard(String bno);
    int updateBoard(BoardVO bvo);
    int deleteBoard(String bno);

    int selectCountBoard();

    int updateViewCount(String bno);

    List<BoardVO> findSelectList(Map<String, Object> param);

    int selectCountBoard(Map<String, String> param);

    BoardVO selectOneFname(String bno, String order);

    int updateDownCount(Map<String, String> param);

    int updateThumbPluBoard(String bno);

    int updateThumbMinBoard(String bno);

    Object selectOneThumb(String bno);

    String selectPreBno(String bno);

    String selectNextBno(String bno);

    String selectLastBno();

    String selectFirstBno();
}
