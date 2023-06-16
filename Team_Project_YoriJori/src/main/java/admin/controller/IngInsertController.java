package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import admin.model.AdminDao;
import ingredient.model.IngBean;

@Controller
public class IngInsertController {
	private final String command = "/insertIng.am";
	private String getPage = "ingInsertForm";
	
	@Autowired
	AdminDao adao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model) {
		List<IngBean> allList = adao.getAllIng();
		model.addAttribute("allList", allList);
		
		String[] ctg = {"���/��/�߰���","���/����ǰ","ä��","����","����/�ػ깰","��/��/��","�ҽ�/����","��Ÿ"};
		model.addAttribute("ctg", ctg);
		
		return getPage; 	
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String insert(@ModelAttribute("ingbean") IngBean ingbean, HttpServletRequest request) {
		
		String folderPath = servletContext.getRealPath("/resources/images/icon");	//������ ���� ���
		File uploadFile = new File(folderPath + File.separator+ ingbean.getUpload().getOriginalFilename());
			
		MultipartFile multi = ingbean.getUpload();
		String str="c:/tempUpload";
		File destination_local= new File(str+File.separator+multi.getOriginalFilename());
			
		int cnt = adao.insertIng(ingbean);
		if(cnt!=-1) {
			try {
				multi.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
					
			request.setAttribute("msg", "����� �߰��� �Ϸ��߽��ϴ�.");
			request.setAttribute("url", "/ex/insertIng.am");
		}
			
		return "am_alert";
		
	}
	
}
