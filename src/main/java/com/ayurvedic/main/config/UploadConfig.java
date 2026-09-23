package com.ayurvedic.main.config;


import java.io.File;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class UploadConfig implements WebMvcConfigurer {

	public UploadConfig() {

        System.out.println("UploadConfig Loaded");
    }


	/*
	 * @Override public void addResourceHandlers(ResourceHandlerRegistry registry) {
	 * 
	 * String uploadPath = System.getProperty("user.home") + File.separator +
	 * "uploads" + File.separator;
	 * 
	 * uploadPath = uploadPath.replace("\\", "/");
	 * 
	 * System.out.println(uploadPath);
	 * 
	 * registry.addResourceHandler("/uploads/**") .addResourceLocations("file:/" +
	 * uploadPath); }
	 */
}