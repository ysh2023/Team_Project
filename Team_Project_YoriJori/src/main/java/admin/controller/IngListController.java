package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.AdminDao;
import ingredient.model.IngBean;

@Controller
public class IngListController {
	private final String command = "/ingList.am";
	private String getPage = "ingList";
	
	@Autowired
	AdminDao adao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model, HttpServletRequest request) {
		
		List<IngBean> allList = adao.getAllIng();
		model.addAttribute("allList", allList);
		
		return getPage; 
		
	}

}
