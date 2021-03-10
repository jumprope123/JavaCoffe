package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.MemberVO;
import javaCoffe.spring.mvc.vo.ZipcodeVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Repository("mdao")
public class MemberDAOImpl implements MemberDAO{

    @Autowired
    private SqlSession sqlSession;


    @Override   // 회원정보 추가
    public int insertMember(MemberVO mvo) {
        return sqlSession.insert("member.insertMember",mvo);
    }

    @Override
    public int selectOneUserid(String uid) {
        return sqlSession.selectOne("member.checkuid",uid);
    }

    @Override
    public int selectLogin(MemberVO mvo) {
        return sqlSession.selectOne("member.checklogin", mvo);
    }

    @Override
    public String readRegdate(String name) {
        return sqlSession.selectOne("member.getRegdate",name);
    }

    //=====================카카오 로그인 설정==========================
    @Override
    public int compareID(int kakaoID) {
        return sqlSession.selectOne("member.compareID",kakaoID);
    }

    @Override
    public String getUserId(int kakaoID) {
        return sqlSession.selectOne("member.getUserId",kakaoID);
    }

    //=====================카카오 로그인 설정==========================
}
//