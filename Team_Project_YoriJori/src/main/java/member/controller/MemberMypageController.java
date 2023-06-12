package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberMypageController {
	
	@Autowired
	MemberDao mdao;

	@RequestMapping("/mypage.mb")
	public String doAction() {
	
		return "mypage";
	}

	
	@RequestMapping("/update.mb")
	public String update_Form(HttpSession session) {
	
		MemberBean mb= (MemberBean)(session.getAttribute("loginInfo"));
		
		String mb_id= mb.getId();
		
		System.out.println(mb_id);
		
		return "updateMember";
	}

}
