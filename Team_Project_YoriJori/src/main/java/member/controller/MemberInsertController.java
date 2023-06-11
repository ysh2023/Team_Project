package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberInsertController {
	private final String command = "/insert.mb";
	private String getPage = "registerForm";
	private String gotoPage = "redirect:login.mb";
	
	@Autowired
	MemberDao mdao;
	


	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction( ) {
	
		return getPage;
	}
	

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(
		 MemberBean member,HttpServletResponse response) {
		
		MemberBean mb = mdao.GetMemberById(member.getId());
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		ModelAndView mav = new ModelAndView();
		int cnt = -1;
		if (mb==null) {

			cnt = mdao.insertMember(member);
			if(cnt != -1)
				mav.setViewName(gotoPage);
			else
				mav.setViewName(getPage);
		}
		
		else {
			System.out.println("이미 아이디 있어!!!!!!!!");
			try {
				out = response.getWriter();
				out.println("<script>alert('해당 아이디가 이미 존재합니다.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			mav.setViewName(getPage);
		
		}
		
		return mav;
	}
	
}
