package com.bid.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
@MapperScan({"com.bid.bo.member.dao", "com.bid.fo.member.dao"})
public class MapperConfig {
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource);

        // MyBatis 설정 파일 위치 설정
        Resource configLocation = new ClassPathResource("mybatis-config.xml");
        sessionFactoryBean.setConfigLocation(configLocation);

        // 매퍼 XML 파일 위치 설정
        Resource[] mapperLocations = new PathMatchingResourcePatternResolver().getResources("classpath:mapper/**/*.xml");
        sessionFactoryBean.setMapperLocations(mapperLocations);

        return sessionFactoryBean.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
