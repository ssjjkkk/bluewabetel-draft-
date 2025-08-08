package com.bluewavetel.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.stereotype.Service;

@Service
public class InitDatabase {

    @Autowired
    private DataSource dataSource;

    public void initDatabase() {
        try {
            ResourceDatabasePopulator resourceDatabasePopulator = new ResourceDatabasePopulator(false, false, "UTF-8", new ClassPathResource("db/init.sql"));
            resourceDatabasePopulator.execute(dataSource);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
