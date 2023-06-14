package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;

@Controller
public class AdminDeleteReportController {
	
	private final String command = "/deleteReport.am";
	private String getPage = "redirect:/mbReportList.am";
	
	
	@Autowired
	AdminDao adao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("id") String id) {
		adao.deleteReport(id);
		return getPage;
	}


}
