package recipe.controller;

import java.util.ArrayList;
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
import recipe.model.RecipeRecommendBean;
import recipe.model.RecipeRecommendListBean;
import utility.Paging2;

@Controller
public class RecipeRecommendController {
	private final String command ="/Recommend.re";
	private final String getPage="RecipeRecommendList";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command )
	public ModelAndView doAction(@RequestParam(value="keyword",required=false) String keyword,
									@RequestParam(value="whatColumn",required=false) String whatColumn,
									RecipeRecommendListBean RRBean,
									@RequestParam(value="pageNumber", required=false) String pageNumber, 
									HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//List<String>을 넘기기 위해 Bean을 만들어서 입력받은 값을 List로 가져옴
		List<String> ingreList = RRBean.getIngredientList();
		int ingredientCount = ingreList.size();
		//식재료를 count만큼 가진 recipe를 얻기위한 count
		String count = String.valueOf(ingredientCount);
		String str = "";
		//넘어온 식재료List를 sql에 맞게 변형
		for(int i=0;i<ingreList.size();i++) {
			if(i==ingreList.size()-1) {
				str += ingreList.get(i);
			}else {
				str += ingreList.get(i)+"|";
			}
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		map.put("count", count);
		int recipeTotalCount = rdao.getRecipeTotalCountByIngre(map);
		String url = request.getContextPath()+command;
		Paging2 pageInfo = new Paging2(pageNumber, "12",recipeTotalCount, url, null, null, null);
		List<RecipeRecommendBean> recipeList = rdao.getRecipeListByIngredient(map,pageInfo);
		
		mav.addObject("ingreList", ingreList);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("recipeList", recipeList);
		mav.setViewName(getPage);
		return mav;
	}
}
