package recipe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recipe.model.FoodBean;
import recipe.model.RecipeBean;
import recipe.model.RecipeContentBean;
import recipe.model.RecipeDao;
import recipe.model.RecipeReviewBean;

@Controller
public class RecipeDetailViewController {
	private final String command="/detail.re";
	private final String getPage="recipeDetailView";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command)
	public String doAction(Model model,@RequestParam(value="recipenum") int recipenum) {
		RecipeBean rbean = rdao.getRecipe(recipenum);
		List<RecipeContentBean> recipeContentList = rdao.getRecipeContent(recipenum);
		List<FoodBean> foodList = rdao.getFood(recipenum); 
		List<RecipeReviewBean> reviewList = rdao.getReviewbyRecipe(recipenum);
		
		model.addAttribute("recipe", rbean);
		model.addAttribute("recipeContentList", recipeContentList);
		model.addAttribute("foodList", foodList);
		model.addAttribute("reviewList", reviewList);
		return getPage;
	}
}
