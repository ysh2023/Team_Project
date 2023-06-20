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
	public String doAction(@RequestParam("id") String id,@RequestParam(value="comNum", required = false) String comNum,@RequestParam(value="reviewnum", required = false) String reviewnum ) {
		
		if(comNum!=null) {
			System.out.println("colnum이 넘어옴");
			 adao.deleteComment(comNum);
		}else {
			System.out.println("reviewnum넘어옴");
			adao.deleteReview(reviewnum);
		}
		
		
		return getPage+"?id="+id;
	}
}
