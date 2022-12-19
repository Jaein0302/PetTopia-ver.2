package com.Pet_Topia;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling  //스케줄러 적용합니다.
public class Pet_topia_JavaApplication {

	public static void main(String[] args) {
		SpringApplication.run(Pet_topia_JavaApplication.class, args);
	}
}
/* http://localhost:9600/pet_topia/ */