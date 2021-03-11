package javaCoffe.spring.mvc.dao;


import javaCoffe.spring.mvc.vo.CoAndMaVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("camdao")
public class CoAndMaDAOImpl implements CoAndMaDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertCoAndMa(CoAndMaVO cdvo)
    {
        return sqlSession.insert("cam.insertCoAndMa", cdvo);
    }

    @Override
    public int UpdateCoAndMa(CoAndMaVO cdvo) {
        return 0;
    }

    @Override
    public int DeleteCoAndMa(CoAndMaVO cdvo) {
        return 0;
    }
}
