package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import ingredient.model.IngBean;

@Controller
public class IngUpdateController {
	private final String command = "/updateIng.am";
	private String getPage = "ingUpdateForm";
	
	@Autowired
	AdminDao adao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value="ingnum",required = false) int ingnum, Model model) {
		List<IngBean> allList = adao.getAllIng();
		model.addAttribute("allList", allList);
		
		IngBean ingbean = adao.getIngDetail(ingnum);
		model.addAttribute("ingbean", ingbean);
		
		String[] ctg = {"���/��/�߰���","���/����ǰ","ä��","����","����/�ػ깰","��/��/��","�ҽ�/����","��Ÿ"};
		model.addAttribute("ctg", ctg);
		
		return getPage; 	
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String update(@ModelAttribute("ingbean") IngBean ingbean, HttpServletRequest request) {
		
		if(ingbean.getIngicon().equals("")) {
			ingbean.setIngicon(ingbean.getOrigin());
		}
		
		String folderPath = servletContext.getRealPath("/resources/images/icon");	//������ ���� ���
		File originFile = new File(folderPath +File.separator+ingbean.getOrigin());
		File uploadFile = new File(folderPath + File.separator+ ingbean.getUpload().getOriginalFilename());
		
		boolean flag = originFile.delete();
		if(flag) {
			System.out.println("���� �̹��� ���� ����");
		}
		
		MultipartFile multi = ingbean.getUpload();
		
		int cnt = adao.updateIng(ingbean);
		if(cnt!=-1) {
			try {
				multi.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
				
			request.setAttribute("msg", "�ش� ����� ���� ������ �Ϸ��߽��ϴ�.");
			request.setAttribute("url", "/ex/updateIng.am?ingnum="+ingbean.getIngnum());
		}
	
		return "am_alert";
	}
	
}
