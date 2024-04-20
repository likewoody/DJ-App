package com.springlec.base.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

/*
 *  MyBatis 사용을 위한 SqlSessionFactoryBean을 생성하는 Class
 */

@Configuration
@MapperScan(basePackages = "com.springlec.base.dao")
public class DataAccessConfig {
	
	@Bean
	SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		sessionFactory.setMapperLocations(
				// 경로 위치는 바꿀 수 있음, resource에서 작업 해줘야 함(.getResources기 때문)
				new PathMatchingResourcePatternResolver().getResources("classpath:mapper/*.xml")
				);
		return sessionFactory.getObject();
	}
	
	@Bean
	SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}

} // End
