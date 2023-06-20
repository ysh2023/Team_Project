package recipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import recipe.model.RecipeBean;
import recipe.model.RecipeDao;
import recipe.model.RecipeRecommendBean;
import utility.Paging;
import utility.Paging2;

@Controller
public class RecipeListController {
	private final String command="/list.re";
	private final String getPage="RecipeList";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="pageNumber",required=false) String pageNumber, 
								@RequestParam(value="keyword",required=false) String keyword,
								@RequestParam(value="whatColumn",required=false) String whatColumn,
								HttpServletRequest request,
								HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("selectCategory", keyword == null ? "All" : keyword);
		Map<String, String> map = new HashMap<String, String>();
			map.put("whatColumn", whatColumn);
			map.put("keyword", "%"+keyword+"%");
			String id = "";
			if (session.getAttribute("loginInfo") != null) {
				id = ((MemberBean) session.getAttribute("loginInfo")).getId();
			}
			map.put("id", id);
		String url = request.getContextPath()+command;
		
		if("food_name".equals(whatColumn)) {
			int ingrecipetotalCount=rdao.getingrecipeTotalCount(map); 
			System.out.println("레시피갯수"+ingrecipetotalCount);
			Paging2 pageInfo = new Paging2(pageNumber, "12", ingrecipetotalCount, url, whatColumn, keyword, null);
			List<RecipeBean> recipeList = rdao.getAllRecipeByIngre(map,pageInfo);
			mav.addObject("recipeList", recipeList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(getPage);
			
		}else if("foodcategory".equals(whatColumn)){
			map.put("keyword", keyword);
			int foodRecipeTotalCount = rdao.getFoodRecipeTotalCount(map);
			System.out.println("레시피갯수"+foodRecipeTotalCount);
			Paging2 pageInfo = new Paging2(pageNumber, "12", foodRecipeTotalCount, url, whatColumn, keyword, null);
			List<RecipeBean> recipeList = rdao.getAllRecipeByFoodCate(map,pageInfo);
			mav.addObject("recipeList", recipeList); 
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(getPage);
			
		}else if("readcount".equals(whatColumn)) {
			int totalCount = rdao.getTotalCount(map);
			Paging2 pageInfo = new Paging2(pageNumber, "12", totalCount, url, whatColumn, keyword, null);
			List<RecipeBean> recipeList = rdao.getAllRecipeByReadCount(map,pageInfo);
			mav.addObject("recipeList", recipeList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(getPage);
			
		}else if("bookmark".equals(whatColumn)) {
			int totalCount = rdao.getTotalCount(map);
			Paging2 pageInfo = new Paging2(pageNumber, "12", totalCount, url, whatColumn, keyword, null);
			List<RecipeBean> recipeList = rdao.getAllRecipeByBookMark(map,pageInfo);
			mav.addObject("recipeList", recipeList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(getPage);
			
		}else {
			int totalCount = rdao.getTotalCount(map);
			Paging2 pageInfo = new Paging2(pageNumber, "12", totalCount, url, whatColumn, keyword, null);
			System.out.println("whatColumn:"+whatColumn);
			System.out.println("totalCount:"+totalCount);
			System.out.println("keyword:"+keyword);
			List<RecipeBean> recipeList = rdao.getAllRecipe(map,pageInfo);
			mav.addObject("recipeList", recipeList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(getPage);
		}
		return mav;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doAction(@RequestParam(value="pageNumber",required=false) String pageNumber,@RequestParam(value="whatColumn") String whatColumn,HttpServletRequest request) {
		String[] ingredient = request.getParameterValues("keyword");
		
		ModelAndView mav = new ModelAndView();
		int ingredientCount = ingredient.length;
		String count ="1";
		String str = "";
		//넘어온 식재료List를 sql에 맞게 변형
		for(int i=0;i<ingredientCount;i++) {
			if(i==ingredientCount-1) {
				str += ingredient[i];
			}else {
				str += ingredient[i]+"|";
			}
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		map.put("count", count);
		int recipeTotalCount = rdao.getRecipeTotalCountByIngre(map);
		String url = request.getContextPath()+"/Recommend.re";
		Paging2 pageInfo = new Paging2(pageNumber, "12",recipeTotalCount, url, null, null, null);
		List<RecipeRecommendBean> recipeList = rdao.getRecipeListByIngredient(map,pageInfo);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("recipeList", recipeList);
		mav.setViewName(getPage);
		return mav;
	}
	
	
}
