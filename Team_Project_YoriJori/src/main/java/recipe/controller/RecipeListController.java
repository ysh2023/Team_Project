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
import utility.Paging;

@Controller
public class RecipeListController {
	private final String command="/list.re";
	private final String getPage="RecipeList";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="pageNumber",required=false) String pageNumber, 
								@RequestParam(value="keyword",required=false) String keyword,
								@RequestParam(value="whatColumn",required=false) String whatColumn,
								HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
			map.put("whatColumn", whatColumn);
			map.put("keyword", "%"+keyword+"%");
		String url = request.getContextPath()+command;
		
		if("food_name".equals(whatColumn)) {
			int ingrecipetotalCount=rdao.getingrecipeTotalCount(map);
			System.out.println("레시피객수"+ingrecipetotalCount);
			Paging pageInfo = new Paging(pageNumber, "12", ingrecipetotalCount, url, whatColumn, keyword, null);
			List<RecipeBean> recipeList = rdao.getAllRecipeByIngre(map,pageInfo);
			mav.addObject("recipeList", recipeList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(getPage);
		}else {
			int totalCount = rdao.getTotalCount(map);
			Paging pageInfo = new Paging(pageNumber, "12", totalCount, url, whatColumn, keyword, null);
			System.out.println(whatColumn);
			System.out.println(totalCount);
			System.out.println(keyword);
			List<RecipeBean> recipeList = rdao.getAllRecipe(map,pageInfo);
			mav.addObject("recipeList", recipeList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(getPage);
		}
		return mav;
	}
	
}
