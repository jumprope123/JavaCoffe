package javaCoffe.spring.mvc.dao;

import javaCoffe.spring.mvc.vo.CoAndMaVO;

public interface CoAndMaDAO {

    int insertCoAndMa(CoAndMaVO cdvo);

    int UpdateCoAndMa(CoAndMaVO cdvo);

    int DeleteCoAndMa(CoAndMaVO cdvo);

}
