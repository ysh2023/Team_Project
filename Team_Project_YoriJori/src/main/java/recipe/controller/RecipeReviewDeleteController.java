package recipe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import recipe.model.RecipeDao;
import recipe.model.RecipeReviewBean;

@Controller
public class RecipeReviewDeleteController {
	public final String command="/deleteReview.re";
	public final String getPage="detail.re";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam("reviewnum") int reviewnum,@RequestParam("recipenum") String recipenum,Model model,HttpSession session) {
		System.out.println(reviewnum);
		System.out.println(recipenum);
		rdao.deleteReview(reviewnum);
		List<RecipeReviewBean> reviewList = rdao.getReviewbyRecipe(Integer.parseInt(recipenum));
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("recipenum",recipenum);
		model.addAttribute("id",((MemberBean)session.getAttribute("loginInfo")).getId());
		return "RecipeReview";
	}
}
