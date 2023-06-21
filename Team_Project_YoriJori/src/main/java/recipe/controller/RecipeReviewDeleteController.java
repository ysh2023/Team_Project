package recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recipe.model.RecipeDao;

@Controller
public class RecipeReviewDeleteController {
	public final String command="/deleteReview.re";
	public final String getPage="detail.re";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam("reviewnum") int reviewnum,@RequestParam("recipenum") String recipenum) {
		//System.out.println("리뷰 삭제에서 recipenum"+recipenum);
		rdao.deleteReview(reviewnum);
		return "redirect:/detail.re?recipenum="+recipenum;	
	}
}
