package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import board.model.CommentReportBean;

@Controller
public class AdminReportDetailController {
	private final String command = "/detailReport.am";
	private String getPage = "detailReport";
	
	@Autowired
	AdminDao adao;
	

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("id") String id ,Model model) {
			
		//id를 넘겨서 그간 신고내역을 불러옴
		List<CommentReportBean> lists=adao.getAllReport(id);
		
		
		model.addAttribute("lists",lists);
		
		return getPage;
	}
}
