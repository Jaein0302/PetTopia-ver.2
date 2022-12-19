package com.Pet_Topia.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	private static final String[] CLASSPATH_RESOURCE_LOCATIONS
	= {
			"classpath:/static/", 
			"classpath:/resources/", 
			"classpath:/META-INF/resources"
	};
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		//url mapping "/"로 접속하면 "/main/main"로 이동합니다.
		registry.addViewController("/").setViewName("forward:/main/main");
	}
	
  	@Override
	  public void addResourceHandlers(ResourceHandlerRegistry registry) {
	  registry.addResourceHandler("/resources/**")
	  .addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS); 
	  registry.addResourceHandler("/summernoteImage/**")
      .addResourceLocations("file:///C:/image/");
	  registry.addResourceHandler("/upload/**")
      .addResourceLocations("file:///C:/upload/");
	  }
	 
	
	
	
}
