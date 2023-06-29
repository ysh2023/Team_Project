package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MypageUpdateMemberController {

	private final String command = "/updateMb.mp";
	private String getPage = "updateMbForm";
	
	@Autowired
	MemberDao mdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpSession session,Model model) {
		
		String user_id= ((MemberBean) session.getAttribute("loginInfo")).getId();	
		
		
		System.out.println(user_id);
		MemberBean mb= mdao.GetMemberById(user_id);
		
		model.addAttribute("mb",mb);
		
		return getPage;
	}

	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String update(MemberBean mb,Model model,HttpServletResponse response,HttpSession session) {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		
		int cnt=mdao.updateMember(mb);
		
		model.addAttribute("mb",mb);
		
		System.out.println(cnt);
		if(cnt>0) {
				try {
					out = response.getWriter();
					out.println("<script>alert('수정이 완료되었습니다.');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				session.setAttribute("loginInfo",  mdao.GetMemberById(mb.getId()));
			
		}
		
		
		return getPage;
	}
}
