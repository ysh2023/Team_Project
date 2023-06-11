package admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import admin.model.AdminDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class AdminProductInsertController {
	
	
    @Autowired
    AdminDao adao;
	
	@Autowired
	ServletContext servletContext;
	
	
	private final String command = "/insertPrd.am";
	private String getPage = "am_prdInsertForm";
	private String gotoPage = "redirect:prdList.am";
	

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String insert(@ModelAttribute("productBean")  ProductBean productBean,HttpServletRequest request) {
		String uploadPath = servletContext.getRealPath("/resources/img_pd");
		File destination = new File(uploadPath+File.separator+productBean.getUpload().getOriginalFilename());

		MultipartFile multi = productBean.getUpload();
		String str="c:/tempUpload";
		File destination_local= new File(str+File.separator+multi.getOriginalFilename());
		
		System.out.print("가격은:"+productBean.getPdprice());
		int cnt = adao.insertProduct(productBean);
		System.out.println("ProductInsertController cnt : " + cnt);
		if(cnt > -1) {
			
			try {
				multi.transferTo(destination);
				
				FileCopyUtils.copy(destination, destination_local);
				//웹서버=>로컬파일
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return gotoPage;
			
		} else {
			return getPage;
		}
	}
}
