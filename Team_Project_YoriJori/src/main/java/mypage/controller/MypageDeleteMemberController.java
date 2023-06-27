package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MypageDeleteMemberController {
	private final String command = "/deleteMb.mp";
	private final String getPage = "/deleteMbForm";
	private String gotoPage = "redirect:/";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}


	@RequestMapping(value = command, method = RequestMethod.POST)
	public String delete(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		
		String _id= ((MemberBean) session.getAttribute("loginInfo")).getId();
		
		MemberBean mb=mdao.GetMemberById(_id);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		
		
		String pw= request.getParameter("pw");
		
		System.out.println("pw"+pw);
		System.out.println("id"+mb.getId());
		
		if(mb.getPw().equals(pw)) {
			int cnt= mdao.deleteMember(mb.getId());
	
			session.invalidate();
			return gotoPage;
		}
		else {
			try {
				out = response.getWriter();
				out.println("<script>alert('비번 틀렸습니다.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}

		
		
		return gotoPage;
	}
}

