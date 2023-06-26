package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;

@Controller
public class AdminBlindReportController {

	private final String command = "/blindReport.am";
	private String getPage = "redirect:/mbReportList.am";

	@Autowired
	AdminDao adao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("comNum") String comNum, @RequestParam("id") String id,
			@RequestParam(value = "repNum", required = false) String repNum,
			@RequestParam(value = "rerepnum", required = false) String rerepnum) {

		int result = adao.blindReport(comNum);

		return getPage + "?id=" + id;
	}

}
