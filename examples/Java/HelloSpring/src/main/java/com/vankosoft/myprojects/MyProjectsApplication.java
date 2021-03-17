package com.vankosoft.myprojects;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.springframework.boot.builder.SpringApplicationBuilder;


//import org.springframework.boot.web.support.SpringBootServletInitializer;
//For SpringBoot 2.0
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MyProjectsApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(MyProjectsApplication.class, args);
	}

}
