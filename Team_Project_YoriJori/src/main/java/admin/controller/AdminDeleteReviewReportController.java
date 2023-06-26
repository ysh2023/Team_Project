package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;

@Controller
public class AdminDeleteReviewReportController {
	
	private final String command = "/deleteReveiwReport.am";
	private String getPage = "redirect:/mbReportList.am";
	
	
	@Autowired
	AdminDao adao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("id") String id) {
		System.out.println(id);
		int cnt = adao.deleteReviewReport(id);
		if(cnt>0) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제성공");
		}
		return getPage;
	}


}
