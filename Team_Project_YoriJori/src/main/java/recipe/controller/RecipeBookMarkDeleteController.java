package recipe.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import recipe.model.RecipeBean;
import recipe.model.RecipeBookMarkBean;
import recipe.model.RecipeDao;

@Controller
public class RecipeBookMarkDeleteController {
	private final String command="/deleteBookmark.re";
	private final String getPage="recipeBookMark";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value = command)
	public String doAction(@RequestParam("recipenum") int recipenum , HttpSession session, Model model) { 
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		RecipeBookMarkBean RBMBean = new RecipeBookMarkBean();
		RBMBean.setId(mb.getId());
		RBMBean.setRecipenum(recipenum);
		int cnt = rdao.deleteBookmark(RBMBean);
		
		if(cnt>0) {
			//bookmark삭제 성공시 북마크 table에서 존재하는 bookmark의 recipenum을 가저옴
			List<Integer> BookmarkList = rdao.getBookmarkById(mb.getId());
			List<RecipeBean> BookmarkRecipeList = new ArrayList<RecipeBean>();
			List<String> foodcategory = new ArrayList<String>();
			for(int i : BookmarkList) {
				//가져온 recipenum으로 recipe 전체를 가져와서 넘겨줌
				RecipeBean rbean = rdao.getRecipe(i);
				BookmarkRecipeList.add(rbean);
				//레시피 카테고리만 담아서 넘김
				foodcategory.add(rbean.getRecipecategory());
			}
			//카테고리에서 중복을 제거 한뒤 recipebookmark.jsp로 넘겨줌
			Set<String> distintList = new HashSet<String>(foodcategory);
			List<String> category = new ArrayList<String>(distintList);
			session.setAttribute("category", category);
			model.addAttribute("BookmarkRecipeList", BookmarkRecipeList);
			model.addAttribute("member", mb);
			System.out.println("북마크 삭제성공");
			
		}else {
			System.out.println("북마크 삭제실패");
		}
		return getPage;
	}
}
