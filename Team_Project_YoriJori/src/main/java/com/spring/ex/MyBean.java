package com.spring.ex;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

public class MyBean implements InitializingBean {

	@Autowired
	ServletContext servletContext;

	@PostConstruct
	public void init() {
		System.out.println("init");
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("----afterPropertiesSet--------");
		String uploadPath = servletContext.getRealPath("/resources/images/");
		System.out.println(uploadPath);
		File destination = new File(uploadPath);

		String str = "c:/tempUpload";
		File destination_local = new File(str);
		FileUtils.copyDirectory(destination_local, destination);
	}
}