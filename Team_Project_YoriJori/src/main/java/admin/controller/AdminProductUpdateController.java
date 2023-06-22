package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class AdminProductUpdateController {
	private final String command = "/updatePrd.am";
	private String getPage = "am_prdUpdateForm";
	private final String gotoPage = "redirect:/prdList.am";
	
	@Autowired
	AdminDao adao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("pdnum") int pdnum) {
		ModelAndView mav = new ModelAndView();
		ProductBean product = adao.getByNum(pdnum);
		
		
		mav.addObject("product", product);
		mav.setViewName(getPage);
		
		return mav; 	
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction(
			@ModelAttribute("ProductBean") @Valid ProductBean productBean) {
		
		if(productBean.getPdimage().equals("")) {
			productBean.setPdimage(productBean.getUpload2());

			System.out.println("사진"+productBean.getPdimage());
			
			int cnt = adao.updateProduct(productBean);
			
			return gotoPage;
			
		}
		else {
			String filePath = servletContext.getRealPath("/resources/img_pd");
			File deleteImage = new File(filePath +File.separator+productBean.getUpload2()); //삭제하려는 이미지
			File destination = new File(filePath + File.separator + productBean.getUpload().getOriginalFilename()); //수정하려는(업로드할) 이미지
			
			System.out.println("사진"+productBean.getPdimage());
			
			int cnt = adao.updateProduct(productBean);
			
			if(cnt > -1) { // DB 테이블에서 수정 성공
				boolean flag = deleteImage.delete();
				System.out.println("삭제: " +flag);
				
				MultipartFile multi = productBean.getUpload();
				try {
					multi.transferTo(destination); // 업로드
					
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
	
	
	
}
