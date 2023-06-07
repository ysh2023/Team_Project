package recipe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import recipe.model.RecipeBean;
import recipe.model.RecipeDao;

@Controller
public class RecipeBookMarkListController {
	private final String commnad="/bookmark.re";
	private final String getPage ="bookMarkList";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value = commnad)
	public String doAction(HttpSession session, Model model ) { 
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/bookmark.re");
			return "redirect:/login.mb";
		}else {
			MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
			List<Integer> BookmarkList = rdao.getBookmarkById(mb.getId());
			List<RecipeBean> BookmarkRecipeList = new ArrayList<RecipeBean>();
			for(int i : BookmarkList) {
				RecipeBean rbean = rdao.getRecipe(i);
				BookmarkRecipeList.add(rbean);
			}
			
			model.addAttribute("BookmarkRecipeList", BookmarkRecipeList);
			model.addAttribute("member", mb);
			//System.out.println(BookmarkRecipeList);
			return getPage;
		}
	}
}
