package recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import recipe.model.RecipeBean;
import recipe.model.RecipeDao;

@Controller
public class RecipeBookMarkListController {
	private final String commnad="/bookmark.re";
	private final String getPage ="bookMarkList";
	private final String getPage2="recipeBookMark";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value = commnad, method= RequestMethod.GET)
	public String doAction(HttpSession session, Model model ) { 
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/bookmark.re");
			return "redirect:/login.mb";
		}else {
			MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
			List<Integer> BookmarkList = rdao.getBookmarkById(mb.getId());
			List<RecipeBean> BookmarkRecipeList = new ArrayList<RecipeBean>();
			List<String> foodcategory = new ArrayList<String>();
			for(int i : BookmarkList) {
				RecipeBean rbean = rdao.getRecipe(i);
				BookmarkRecipeList.add(rbean);
				foodcategory.add(rbean.getRecipecategory());
			}
			Set<String> distintList = new HashSet<String>(foodcategory);
			List<String> category = new ArrayList<String>(distintList);
			model.addAttribute("name", mb.getMname());
			session.setAttribute("category", category);
			model.addAttribute("BookmarkRecipeList", BookmarkRecipeList);
			return getPage;
		}
	}
	
	@RequestMapping(value = commnad, method= RequestMethod.POST)
	public String doAction(@RequestParam("keyword") String keyword, HttpSession session,Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", mb.getId());
		if(keyword.equals("All")) {
			map.put("whatColumn", null);
			map.put("keyword", null);
		}else {
			map.put("keyword", keyword);
			map.put("whatColumn", "recipe_category");
		}
		
		List<RecipeBean> BookmarkRecipeList = rdao.getBookMarkRecipe(map);
		List<Integer> BookmarkList = rdao.getBookmarkById(mb.getId());
		List<String> foodcategory = new ArrayList<String>();
		for(int i : BookmarkList) {
			RecipeBean rbean = rdao.getRecipe(i);
			foodcategory.add(rbean.getRecipecategory());
		}
		Set<String> distintList = new HashSet<String>(foodcategory);
		List<String> category = new ArrayList<String>(distintList);
		model.addAttribute("name", mb.getMname());
		session.setAttribute("category", category);
		model.addAttribute("BookmarkRecipeList", BookmarkRecipeList);
		
		return getPage2;
	}
	
}
