package recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import recipe.model.RecipeBookMarkBean;
import recipe.model.RecipeDao;

@Controller
public class RecipeBookMarkInsertController {
	private final String command="/BookmarkInsert.re";
	private final String getPage2="redirect:/detail.re";
	
	@Autowired
	RecipeDao rdao;
	
	//recipeList에서 찜 버튼 눌렀을때 get(ajax사용)
	@RequestMapping(value=command, method=RequestMethod.GET)
	@ResponseBody
	public String doAction(HttpSession session,@RequestParam("recipenum") int recipenum) {
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
			int result = rdao.insertBookMark(BMBean);
			
				if (result > 0) {
					return "1";
				} else {
					return "-1";
				}
			
		}else {
			int result = rdao.deleteBookmark(BMBean);
			if (result > 0) {
				return "0";
			} else {
				return "-1";
			}
		}
	}
	
	//recipedetail에서 찜 버튼 눌렀을때 post(insert,delete사용)
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
		//북마크가 이미 등록되어있는지 확인 되어있으면 삭제 없으면 추가
		if(flag == false) {
			rdao.insertBookMark(BMBean);
		}else {
			rdao.deleteBookmark(BMBean);
		}
		model.addAttribute("recipenum",recipenum);
		return getPage2;
	}
}
