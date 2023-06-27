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
		//System.out.println("init");
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		//System.out.println("----afterPropertiesSet--------");
		String uploadPath = servletContext.getRealPath("/resources/images/");
		//System.out.println(uploadPath);
		File destination = new File(uploadPath);

		String str = "c:/tempUpload";
		File destination_local = new File(str);
		if (!destination_local.exists()) {
			if (destination_local.mkdir()) {
				System.out.println("폴더가 없으므로 tempUpload폴더 생성");
			} else {
				System.out.println("tempUpload폴더 생성 실패");
			}
		}
		FileUtils.copyDirectory(destination_local, destination);
	}
}