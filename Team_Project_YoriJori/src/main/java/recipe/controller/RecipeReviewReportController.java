package recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import recipe.model.RecipeDao;
import recipe.model.RecipeReviewReportBean;

@Controller
public class RecipeReviewReportController {
	private final String command="/report.re";
	private final String getPage="RecipeReviewReportForm";

	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam ("reviewnum") int reviewnum , @RequestParam ("recipenum") int recipenum) {
		return getPage;
	}
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction2(RecipeReviewReportBean reportBean,@RequestParam("recipenum") int recipenum) {
		int cnt =rdao.insertReport(reportBean);
		if(cnt>0) {
			System.out.println("신고 성공");
		}else {
			System.out.println("신고 실패");
		}
		return "redirect:/detail.re?recipenum="+recipenum;
	}
	
}
