package recipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
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
	public ModelAndView doAction(@RequestParam(value="pageNumber",required=false) String pageNumber,
								@RequestParam("whatColumn") String whatColumn,
								@RequestParam("keyword") String keyword,
								HttpServletRequest request,
								HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("selectCategory", keyword == null ? "All" : keyword);
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", keyword);
		String id = "";
		if (session.getAttribute("loginInfo") != null) {
			id = ((MemberBean) session.getAttribute("loginInfo")).getId();
		}
		map.put("id", id);
		String url = request.getContextPath()+command;
		List<String> ingredientList = rdao.getIngredientByCategory(keyword);
		for(String x : ingredientList) {
			System.out.println(x);
		}
		if("food_name".equals(whatColumn)) {
			ingredientList = (List<String>) session.getAttribute("ingredientList");
			map.put("keyword", "%"+keyword+"%");
			int ingrecipetotalCount=rdao.getingrecipeTotalCount(map); 
			Paging2 pageInfo = new Paging2(pageNumber, "12", ingrecipetotalCount, url, whatColumn, keyword, null);
			List<RecipeBean> recipeList = rdao.getAllRecipeByIngre(map,pageInfo);
			
			mav.addObject("keyword", session.getAttribute("keyword")); 
			mav.addObject("ingreList", ingredientList); 
			mav.addObject("recipeList", recipeList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(getPage);
			return mav;
		}else {	
			session.setAttribute("ingredientList", ingredientList);
			session.setAttribute("keyword", keyword);
			int foodRecipeTotalCount = rdao.getFoodRecipeTotalCount(map);
			Paging2 pageInfo = new Paging2(pageNumber, "12", foodRecipeTotalCount, url, whatColumn, keyword, null);
			List<RecipeBean> recipeList = rdao.getAllRecipeByFoodCate(map,pageInfo);
			mav.addObject("keyword", keyword);
			mav.addObject("recipeList", recipeList); 
			mav.addObject("ingreList", ingredientList); 
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(getPage);
			return mav;
		}
	}
}
