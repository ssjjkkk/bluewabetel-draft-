package com.bluewavetel.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

/**
 * @file CommonMasterDAO.java
 * @author HwangDanbi
 * @version 1.0
 * @date 2023.05
 * 
 * @description 공통 Master DAO 인터페이스
 * Mapper.xml 쿼리문 신규등록 시에 개별로 DAO생성을 막기 위해 공통 Master DAO를 등록하여 관리
 */

@Mapper
public interface CommonDao {
	
    /**
     * INSERT 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return INSERT 후 반환 특히 ID 객체를 반환한다.
     */
	public int insert(String queryId, Object parameterObject);

    /**
     * UPDATE 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 적용 건 수를 반환한다.
     */
	public int update(String queryId, Object parameterObject);

    /**
     * DELETE 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 적용 건 수를 반환한다.
     */
	public int delete(String queryId, Object parameterObject);
	
    /**
     * 한 건 조회를 위한 SQL을 실행하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @return 조회한 결과를 반환한다.
     */
	public <T> T select(String queryId);

    /**
     * 한 건 조회를 위한 SQL을 실행하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 반환한다.
     */
	public <T> T select(String queryId, Object parameterObject);

    /**
     * 목록 조회를 위한 SQL을 실행하여 List를 구성하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 List로 구성하여 반환한다.
     */
	public <E> List<E> selectList(String queryId, Object parameterObject);
	
    /**
     * 목록 조회를 위한 SQL을 실행하여 List를 구성하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @return 조회한 결과를 List로 구성하여 반환한다.
     */
	public <E> List<E> selectList(String queryId);
	
    /**
     * commit 이 필요한 DB 에서 commit 을 수행한다.
     * @throws SQLException 
     */
    public void commit() throws SQLException;
    
    public void rollback() throws SQLException;
    
    public void close() throws SQLException;
    
}
