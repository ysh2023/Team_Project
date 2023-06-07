package recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recipe.model.RecipeDao;
import recipe.model.RecipeReviewBean;

@Controller
public class RecipeReviewInsertController {
	private final String command="/insertReview.re";
	private final String getPage="redirect:/detail.re";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value = command)
	public String doAction(Model model ,HttpSession session,RecipeReviewBean reviewbean) {
		model.addAttribute("recipenum", reviewbean.getRecipenum());
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/detail.re?recipenum="+reviewbean.getRecipenum()); 
			return "redirect:/login.mb";
		}
		
		int cnt = rdao.insertReview(reviewbean);
		if(cnt>0) {
			System.out.println("리뷰등록 성공");
		}else {
			System.out.println("리뷰등록 실패");
		}
		return getPage;
	}
}
