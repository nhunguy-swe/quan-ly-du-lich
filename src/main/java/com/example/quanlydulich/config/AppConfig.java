package com.example.quanlydulich.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableWebMvc
@EnableTransactionManagement // Bắt buộc phải có để kích hoạt @Transactional ở tầng Service
@ComponentScan(basePackages = "com.example.quanlydulich") // Đổi lại package chuẩn của bạn nếu khác
public class AppConfig {

    // 1. Cấu hình ViewResolver điều hướng tệp JSP (Đã làm ở bước trước)
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    // 2. Cấu hình Kết nối Cơ sở dữ liệu (DataSource) sử dụng thư viện DBCP2 có trong POM
    @Bean
    public DataSource dataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/quanlydulich?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true");
        dataSource.setUsername(""); // Điền Username tài khoản MySQL của bạn vào đây
        dataSource.setPassword(""); // Điền Mật khẩu tài khoản MySQL của bạn vào đây
        return dataSource;
    }

    // 3. ĐỊNH NGHĨA SESSIONFACTORY (Bean bị thiếu gây ra lỗi 500 của bạn)
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setPackagesToScan("com.example.quanlydulich.entity"); // Đường dẫn quét các class Entity có @Table

        // Các thuộc tính cấu hình Hibernate đi kèm
        Properties hibernateProperties = new Properties();
        hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        hibernateProperties.setProperty("hibernate.show_sql", "true"); // In câu lệnh SQL ra Console để dễ kiểm tra
        hibernateProperties.setProperty("hibernate.format_sql", "true");

        sessionFactory.setHibernateProperties(hibernateProperties);
        return sessionFactory;
    }

    // 4. Cấu hình quản lý Transaction tự động cho Hibernate Session
    @Bean
    public PlatformTransactionManager hibernateTransactionManager() {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(sessionFactory().getObject());
        return transactionManager;
    }
}