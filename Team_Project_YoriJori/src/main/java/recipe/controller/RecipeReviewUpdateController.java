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
import recipe.model.RecipeDao;
import recipe.model.RecipeReviewBean;

@Controller
public class RecipeReviewUpdateController {
	private final String command="/updateReview.re";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam("recipenum") String recipenum,
							@RequestParam("reviewnum") String reviewnum, 
							@RequestParam("review") String review,
							Model model,
							HttpSession session) {
		
		Map<String, String> map =new HashMap<String, String>();
		map.put("reviewnum", reviewnum);
		map.put("review", review);
		int cnt = rdao.UpdateReview(map);
		List<RecipeReviewBean> reviewList = rdao.getReviewbyRecipe(Integer.parseInt(recipenum));
		if(cnt>0) {
			model.addAttribute("reviewList",reviewList);
			model.addAttribute("id",((MemberBean)session.getAttribute("loginInfo")).getId());
		}else {
			
		}
		return "RecipeReview";
	}
}
