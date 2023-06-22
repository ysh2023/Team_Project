package recipe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import recipe.model.RecipeDao;
import recipe.model.RecipeReviewBean;

@Controller
public class RecipeReviewInsertController {
	private final String command="/insertReview.re";
	private final String getPage="RecipeReview";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value = command)
	public String doAction(Model model ,HttpSession session,@RequestParam("recipenum") int recipenum,@RequestParam("review") String review) {
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/detail.re?recipenum="+recipenum); 
			return "redirect:/login.mb";
		}
		RecipeReviewBean reviewbean = new RecipeReviewBean();
		reviewbean.setId(((MemberBean)session.getAttribute("loginInfo")).getId());
		reviewbean.setRecipenum(recipenum);
		reviewbean.setReview(review);
		int cnt = rdao.insertReview(reviewbean);
		List<RecipeReviewBean> reviewList = rdao.getReviewbyRecipe(reviewbean.getRecipenum());
		if(cnt>0) {
			model.addAttribute("reviewList",reviewList);
			model.addAttribute("recipenum",recipenum);
			model.addAttribute("id",((MemberBean)session.getAttribute("loginInfo")).getId());
			System.out.println("리뷰등록 성공");
		}else { 
			System.out.println("리뷰등록 실패");
		}
		return getPage;
	}
}
