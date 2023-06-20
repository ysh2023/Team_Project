package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import board.model.BoardDao;
import board.model.CommentReportBean;
import member.model.MemberDao;
import recipe.controller.RecipeReviewReportController;
import recipe.model.RecipeReviewReportBean;

@Controller
public class AdminMemberReportListController {
	
	private final String command = 	"/mbReportList.am";
	private String getPage = "am_mbreportList";

	
	@Autowired
	AdminDao adao;
	
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<CommentReportBean> lists = adao.getReportlist();
		List<RecipeReviewReportBean> recipelist = adao.getRecipeReportlist();
		
		
		mav.addObject("lists", lists);
		mav.addObject("recipelist", recipelist);
		mav.setViewName(getPage);
		
		return mav; 
		
	}
}
