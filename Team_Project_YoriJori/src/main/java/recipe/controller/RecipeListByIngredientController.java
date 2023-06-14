package recipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import recipe.model.RecipeBean;
import recipe.model.RecipeDao;
import utility.Paging2;

@Controller
public class RecipeListByIngredientController {
	private final String command="/listByIng.re";
	private final String getPage="RecipeByIngredient";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="pageNumber",required=false) String pageNumber,@RequestParam("whatColumn") String whatColumn, @RequestParam("keyword") String keyword,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(whatColumn);
		System.out.println(keyword);
		map.put("whatColumn", whatColumn);
		map.put("keyword", keyword);
		
		String url = request.getContextPath()+command;
		
		List<String> ingreList = rdao.getIngredientByCategory(keyword);
		System.out.println("ingreListSize:"+ingreList.size());
		int foodRecipeTotalCount = rdao.getFoodRecipeTotalCount(map);
		System.out.println("레시피갯수"+foodRecipeTotalCount);
		Paging2 pageInfo = new Paging2(pageNumber, "12", foodRecipeTotalCount, url, whatColumn, keyword, null);
		List<RecipeBean> recipeList = rdao.getAllRecipeByFoodCate(map,pageInfo);
		System.out.println("recipe갯수"+recipeList.size());
		mav.addObject("keyword", keyword);
		mav.addObject("recipeList", recipeList); 
		mav.addObject("ingreList", ingreList); 
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage);
		return mav;
	}
}
