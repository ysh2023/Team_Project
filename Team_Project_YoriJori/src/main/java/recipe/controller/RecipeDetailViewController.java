package recipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import recipe.model.FoodBean;
import recipe.model.RecipeBean;
import recipe.model.RecipeBookMarkBean;
import recipe.model.RecipeContentBean;
import recipe.model.RecipeDao;
import recipe.model.RecipeReviewBean;
import refrigerator.model.RefBean;
import refrigerator.model.RefDao;

@Controller
public class RecipeDetailViewController {
	private final String command="/detail.re";
	private final String getPage="recipeDetailView"; 
	
	@Autowired
	RecipeDao rdao;
	
	@Autowired
	RefDao refdao;
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session,Model model,@RequestParam(value="recipenum") int recipenum) {
		String msg="";
		if(session.getAttribute("loginInfo")==null) {
			msg="noid";
		}else {
			MemberBean mb =  (MemberBean)session.getAttribute("loginInfo");
			RecipeBookMarkBean mbBean = new RecipeBookMarkBean();
			mbBean.setId(mb.getId());
			mbBean.setRecipenum(recipenum);
			Boolean flag = rdao.checkBookMark(mbBean);
			if(flag) {//북마크 되있는거
				msg="yes";
			}else {//안되있는거
				msg="no";
			}
		}
		if(session.getAttribute("recipeReadCount"+String.valueOf(recipenum)) == null) {
			int cnt = rdao.updateReadCount(recipenum);
			session.setAttribute("recipeReadCount"+String.valueOf(recipenum), recipenum);
		}
		RecipeBean rbean = rdao.getRecipe(recipenum);
		MemberBean mb =  (MemberBean)session.getAttribute("loginInfo");
		List<RecipeContentBean> recipeContentList = rdao.getRecipeContent(recipenum);
		List<FoodBean> foodList = rdao.getFood(recipenum); 
		List<RecipeReviewBean> reviewList = rdao.getReviewbyRecipe(recipenum);
		int SelectedRecipeCount = rdao.getBookmarkCount(recipenum);
		if(mb != null) {
			model.addAttribute("id", mb.getId());
			
			/* 냉장고 전체 리스트 */
			Map<String,String> listMap = new HashMap<String,String>();
			listMap.put("id", mb.getId());
			listMap.put("arrange", "r.inputdate");
			List<RefBean> refList = refdao.getUserRef(listMap);
			model.addAttribute("refList",refList);
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("recipe", rbean);
		model.addAttribute("recipeContentList", recipeContentList);
		model.addAttribute("foodList", foodList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("SelectedRecipeCount", SelectedRecipeCount);
		session.setAttribute("destination", "redirect:/detail.re?recipenum="+recipenum);
		return getPage; 
	}                    
}
