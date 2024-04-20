package com.springlec.base.config;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Configuration;

/*
 *  DB 사용을 위한 설정파일로 application.properties에 선언된 
 *  spring.datasource.* 값들로 DataSource를 빌드하기 위해 사용
 */

@Configuration
public class DataSourceConfig {
	@ConfigurationProperties(prefix="spring.datasource")
	public DataSource dataSource() {
		return DataSourceBuilder.create().build();
	}
}
