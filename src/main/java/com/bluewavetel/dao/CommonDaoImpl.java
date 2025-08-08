package com.bluewavetel.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("commonDAO")
public class CommonDaoImpl implements CommonDao {
	
    @Autowired
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;
    
    /**
     * INSERT 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return INSERT 후 반환 특히 ID 객체를 반환한다.
     */
    @Override
	public int insert(String statementName, final Object parameter) {
        return sqlSession.insert(statementName, parameter);
    }

    /**
     * UPDATE 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 적용 건 수를 반환한다.
     */
    @Override
	public int update(String statementName, final Object parameter) {
        return sqlSession.update(statementName, parameter);
    }

    /**
     * DELETE 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 적용 건 수를 반환한다.
     */
    @Override
	public int delete(String statementName, final Object parameter) {
        return sqlSession.delete(statementName, parameter);
    }
    
    /**
     * 한 건 조회를 위한 SQL을 실행하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 반환한다.
     * 
     * @SuppressWarnings("unchecked") 사용 =>  제네릭 타입 경고 억제 
     */
    @SuppressWarnings("unchecked")
    @Override
    public <T> T select(String statementName) {
        return sqlSession.selectOne(statementName);
    }

    /**
     * 한 건 조회를 위한 SQL을 실행하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 반환한다.
     * 
     * @SuppressWarnings("unchecked") 사용 =>  제네릭 타입 경고 억제 
     */
    @SuppressWarnings("unchecked")
    @Override
    public <T> T select(String statementName, final Object parameter) {
        return sqlSession.selectOne(statementName, parameter);
    }
    
    /**
     * 목록 조회를 위한 SQL을 실행하여 List를 구성하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 List로 구성하여 반환한다.
     * 
     * @SuppressWarnings("unchecked") 사용 =>  제네릭 타입 경고 억제 
     */
    @SuppressWarnings("unchecked")
    @Override
    public <E> List<E> selectList(String statementName, final Object parameter) {
        return sqlSession.selectList(statementName, parameter);
    }
    
    /**
     * 목록 조회를 위한 SQL을 실행하여 List를 구성하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @return 조회한 결과를 List로 구성하여 반환한다.
     * 
     * @SuppressWarnings("unchecked") 사용 =>  제네릭 타입 경고 억제 
     */
	@Override
	public <E> List<E> selectList(String statementName) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(statementName);
	}


    @Override
	public void commit() throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.commit();
	}

    @Override
	public void rollback() throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.rollback();
	}

    @Override
	public void close() throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.close();
	}
}
