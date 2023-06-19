package mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;

@Controller
public class MypageMainController {
	private final String command = "/mypage.mp";
	private String getPage = "mypage";
	

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model,HttpSession session) {
		
		
		String name=((MemberBean)session.getAttribute("loginInfo")).getMname();
		 
		 
		model.addAttribute("name",name);
		
		return getPage;
	}

}
