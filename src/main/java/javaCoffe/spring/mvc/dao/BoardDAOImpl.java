package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.BoardVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("bdao")
public class BoardDAOImpl implements BoardDAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public int insertBoard(BoardVO bvo) {
        return sqlSession.insert("board.insertBoard", bvo);
    }

    @Override
    public List<BoardVO> selectBoard(int snum) {
        return sqlSession.selectList("board.selectList", snum);
    }

    @Override
    public List<BoardVO> findSelectList(Map<String, Object> param) {
        return sqlSession.selectList("board.findSelectList", param);
    }

    @Override
    public BoardVO selectOneBoard(String bno) {
        return sqlSession.selectOne("board.selectOne",bno);
    }

    @Override
    public int updateBoard(BoardVO bvo) {
        return sqlSession.update("board.updateBoard", bvo);
    }

    @Override
    public int deleteBoard(String bno) {
        return sqlSession.delete("board.deleteBoard", bno);
    }

    @Override
    public int selectCountBoard(){
        return sqlSession.selectOne("board.countBoard");
    }

    @Override
    public int updateViewCount(String bno) {
        return sqlSession.update("board.viewCount", bno);
    }

    @Override
    public int selectCountBoard(Map<String, String> param) {
        return sqlSession.selectOne("board.findCountBoard", param);
    }

    @Override
    public BoardVO selectOneFname(String bno, String order) {
        Map<String, String> param = new HashMap<>();
        param.put("bno", bno);
        param.put("order", "fname"+order);

        return sqlSession.selectOne("board.selectOneFname",param);    }

    @Override
    public int updateDownCount(Map<String, String> param) {
        return sqlSession.update("board.downCount", param);
    }

    @Override
    public int updateThumbPluBoard(String bno) { return sqlSession.update("board.updateThumbPluBoard", bno); }

    @Override
    public int updateThumbMinBoard(String bno) { return sqlSession.update("board.updateThumbMinBoard", bno); }

    @Override
    public BoardVO selectOneThumb(String bno) { return sqlSession.selectOne("board.selectOneThumbBoard",bno); }

    @Override
    public String selectPreBno(String bno) { return sqlSession.selectOne("board.selectOnePreBno",bno);  }

    @Override
    public String selectNextBno(String bno) { return sqlSession.selectOne("board.selectOneNextBno",bno); }

    @Override
    public String selectLastBno() {return sqlSession.selectOne("board.selectLastBno");  }

    @Override
    public String selectFirstBno() { return sqlSession.selectOne("board.selectFirstBno"); }

}
