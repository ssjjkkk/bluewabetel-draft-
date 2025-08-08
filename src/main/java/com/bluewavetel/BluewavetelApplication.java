package com.bluewavetel;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.bluewavetel.config.InitDatabase;

@SpringBootApplication
public class BluewavetelApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(BluewavetelApplication.class, args);
	}

	@Bean
    CommandLineRunner initDatabaseRunner(InitDatabase initDatabaseService) {
    	System.out.println("=============== Init Database =============");
        return args -> {
            initDatabaseService.initDatabase();
        };
    }

}
