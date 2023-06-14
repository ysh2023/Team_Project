package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;

@Controller
public class AdminDeleteCommentController {
	
	private final String command = "/deleteComment.am";
	private final String getPage = "redirect:/detailReport.am";
	
	@Autowired
	AdminDao adao;
	

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("id") String id,@RequestParam("comNum") int comNum ) {
		
		adao.deleteComment(comNum);
		
		
		
		return getPage+"?id="+id;
	}
}
