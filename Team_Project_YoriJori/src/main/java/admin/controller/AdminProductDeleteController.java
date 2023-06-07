package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.moel.AdminDao;

@Controller
public class AdminProductDeleteController {
	private final String command = "deletePrd.am";
	private String getPage = "redirect:prdList.am";
	
	@Autowired
	@Qualifier("myAdminDao")
	AdminDao adao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("pdnum") int pdnum) {
		
		int num=adao.deleteProduct(pdnum);
	
	
		return getPage;
	}
}
