package admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;

@Controller
public class AdminBlindReportController {

	private final String command = "/blindReport.am";
	private String getPage = "redirect:/detailReport.am";

	@Autowired
	AdminDao adao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("id") String id,
			@RequestParam(value = "repNum", required = false) String repNum,
			@RequestParam(value = "rerepnum", required = false) String rerepnum) {
		Map<String, String> map = new HashMap<String, String>();
		if(repNum!=null) {	
			if(adao.checkComment(repNum)) {
				System.out.println("report=1,블라인드");
				map.put("repNum", repNum);
				map.put("num", "0");
				int result = adao.blindReport(map);
			}else {
				System.out.println("report=0");
				map.put("repNum", repNum);
				map.put("num", "1");
				int result = adao.blindReport(map);
			}
		}else {
			if(adao.checkReport(rerepnum)) {
				System.out.println("report=1,블라인드");
				map.put("rerepnum", rerepnum);
				map.put("num", "0");
				adao.updateReview(map);
			}else {
				System.out.println("report=0");
				map.put("rerepnum", rerepnum);
				map.put("num", "1");
				adao.updateReview(map);
			}
			
		}
		
		return getPage + "?id=" + id;
	}

}
