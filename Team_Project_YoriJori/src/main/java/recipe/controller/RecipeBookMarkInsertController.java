package recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import recipe.model.RecipeBookMarkBean;
import recipe.model.RecipeDao;

@Controller
public class RecipeBookMarkInsertController {
	private final String command="/BookmarkInsert.re";
	private final String getPage="redirect:/bookmark.re";
	
	@Autowired
	RecipeDao rdao;
	
	//recipeList에서 찜 버튼 눌렀을때 get
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(HttpSession session,@RequestParam("recipenum") int recipenum,Model model) {
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/list.re?recipenum="+recipenum); 
			return "redirect:/login.mb";
		}
		RecipeBookMarkBean BMBean = new RecipeBookMarkBean();
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		BMBean.setId(mb.getId());
		BMBean.setRecipenum(recipenum);
		boolean flag = rdao.checkBookMark(BMBean);
		if(flag == false) {
			rdao.insertBookMark(BMBean);
		}else {
			//model.addAttribute("msg", "중복");
		}
		return getPage;
	}
	
	//recipedetail에서 찜 버튼 눌렀을때 post
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doAction2(HttpSession session,@RequestParam("recipenum") int recipenum,Model model) {
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/detail.re?recipenum="+recipenum); 
			return "redirect:/login.mb";
		}
		RecipeBookMarkBean BMBean = new RecipeBookMarkBean();
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		BMBean.setId(mb.getId());
		BMBean.setRecipenum(recipenum);
		boolean flag = rdao.checkBookMark(BMBean);
		if(flag == false) {
			rdao.insertBookMark(BMBean);
		}else {
			//model.addAttribute("msg", "중복");
		}
		return getPage;
	}
}
