package recipe.controller;

import java.io.IOException; 

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import recipe.model.RecipeDao;
import recipe.model.RecipeReviewReportBean;

@Controller
public class RecipeReviewReportController {
	private final String command="/report.re";

	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command)
	public void doAction(@RequestParam ("reviewnum") String reviewnum , 
							@RequestParam ("reviewid") String reviewid ,
							@RequestParam ("reportreason") String reportreason,
							@RequestParam("reportcontent") String reportcontent,
							HttpSession session,
							HttpServletResponse response) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		RecipeReviewReportBean reportBean = new RecipeReviewReportBean();
		reportBean.setReviewnum(Integer.parseInt(reviewnum));
		reportBean.setReportreason(reportreason);
		reportBean.setReportcontent(reportcontent);
		reportBean.setId(mb.getId());
		reportBean.setIdorigin(reviewid);

		//System.out.println("revienum:"+reviewnum);
		System.out.println("reviewid:"+reviewid);
		//System.out.println("reportreason:"+reportreason);
		//System.out.println("reportcontent:"+reportcontent);
		//System.out.println("id:"+mb.getId());
		
		int cnt =rdao.insertReport(reportBean);
		if(cnt>0) {
			try {
				response.getWriter().append("신고가 접수되었습니다.").flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				response.getWriter().append("신고를 실패했습니다.").flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
}
