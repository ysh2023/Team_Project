package admin.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import product.model.ProductBean;

@Controller
public class AdminProductDeleteController {
	private final String command = "deletePrd.am";
	private String getPage = "redirect:prdList.am";
	
	@Autowired
	@Qualifier("myAdminDao")
	AdminDao adao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("pdnum") int pdnum) {
		
		ProductBean pBean= adao.getByNum(pdnum);
		
		int cnt=adao.deleteProduct(pdnum);
		
		if(cnt != -1) {
			System.out.println("DB 삭제 성공");
			
			//resources 폴더 경로
			String deletePath = servletContext.getRealPath("/resources/img_pd");
			System.out.println("deletePath:" + deletePath+"\\"+pBean.getPdimage());
			
			//이미지 파일 경로
			File prdImage = new File(deletePath+File.separator+pBean.getPdimage());
			
			boolean flag = prdImage.delete();
			
			if(flag==true) {
				System.out.println("이미지 삭제 성공");
			}else {
				System.out.println("이미지 삭제 실패");
			}
			
		}
		else {
			System.out.println("삭제 실패");
		}
	
	
		return getPage;
	}
}
