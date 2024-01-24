package com.bid;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class AppFoApplication {

	public static void main(String[] args) {
		SpringApplication.run(AppFoApplication.class, args);
	}

}
 