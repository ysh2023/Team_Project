package recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import recipe.model.RecipeDao;

@Controller
public class RecipeBookMarkDeleteController {
	private final String command="/deleteBookmark.re";
	private final String getPage="redirect:/bookmark.re";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value = command)
<<<<<<< HEAD
	public String doAction(@RequestParam("recipenum") String recipenum , HttpSession session) { 
=======
	public String doAction(@RequestParam("recipenum") int recipenum , HttpSession session) { 
>>>>>>> 68ecb88c2fbc40c16c5e33286970ead1db0ace35
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		mb.setTel(recipenum);
		int cnt = rdao.deleteBookmark(mb);
		if(cnt>0) {
			System.out.println("삭제성공");
			
		}else {
			System.out.println("삭제실패");
		}
		return getPage;
	}
}
