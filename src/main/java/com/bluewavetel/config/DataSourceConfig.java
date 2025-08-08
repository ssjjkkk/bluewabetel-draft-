package com.bluewavetel.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.aisystems.dao")
public class DataSourceConfig {

    @Bean(name="dataSource")
    @ConfigurationProperties(prefix = "spring.datasource.hikari")
    DataSource dataSource() {
    	//System.out.println("============================ LOG : dataSource Bean 객체 생성 ===================================");
        return DataSourceBuilder.create().build();
    }
	
    @Bean
    SqlSessionFactory sqlSessionFactory(DataSource dataSource, ApplicationContext applicationContext) throws Exception {
    	
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
    	//System.out.println("============================ LOG : sqlSessionFactory Bean 객체 생성 ============================");
        sqlSessionFactoryBean.setDataSource(dataSource);
        
        //mybatis xml에서 컬럼명을 CamelCase적용하여 Dto로 적용
		sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:/mybatis-config.xml"));
		
		//mapper xml 폴더 위치 적용
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/*.xml"));
        
        return sqlSessionFactoryBean.getObject();
    }

    @Bean(name="sqlSessionTemplate")
    SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
    	//System.out.println("============================ LOG : sqlSessionTemplate Bean 객체 생성 ===========================");
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}