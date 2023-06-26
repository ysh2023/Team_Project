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
	public String doAction(@RequestParam("id") String id,@RequestParam(value="repNum", required = false) String repNum,@RequestParam(value="rerepnum", required = false) String rerepnum ) {
		
		if(repNum!=null) {
			 adao.deleteComments(repNum);
			 adao.deleteCommentReport(repNum);
			 
		}else {
			adao.deleteReview(rerepnum);
			int cnt = adao.deleteReviewReportByRerepnum(rerepnum);
			if(cnt>0) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제실패");
			}
		}
		
		
		return getPage+"?id="+id;
	}
}
