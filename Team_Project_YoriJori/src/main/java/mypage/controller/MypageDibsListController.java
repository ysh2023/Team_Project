package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import mypage.model.DibsDao;
import product.model.ProductBean;
import utility.Paging;


@Controller
public class MypageDibsListController {
	private final String command = "/listDibs.mp";
	private String getPage = "listDibs";
	
	@Autowired
	DibsDao ddao;
	

	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(HttpSession session,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String user_id= ((MemberBean) session.getAttribute("loginInfo")).getId();	
		
		String url= request.getContextPath()+command;
		
		int totalCount=ddao.getTotalCount(user_id);
		
		String whatColumn=null;
		String keyword=null;
		

		List<ProductBean> lists= ddao.getAllDibs(user_id);
		
		mav.addObject("lists", lists);
		mav.addObject("user_id", user_id);
		mav.setViewName(getPage);
		return mav; 
		
		
	}
}
