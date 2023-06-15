package admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.AdminDao;

@Controller
public class AdminIngListController {
	private final String command = "/ingList.am";
	private String getPage = "am_ingList";
	
	@Autowired
	AdminDao adao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model, HttpServletRequest request) {
		
		return getPage; 
		
	}

}
