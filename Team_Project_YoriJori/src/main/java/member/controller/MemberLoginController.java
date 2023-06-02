package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private final String command = "/login.mb";
	private String getPage = "loginForm";
	private String gotoPage = "./../../main";
	
	@Autowired
	MemberDao mdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		String destination = (String)session.getAttribute("destination");
		System.out.println("destination: "+destination);
		
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("id") String input_id, @RequestParam("password") String input_password,
			HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;

		MemberBean mb = mdao.GetMemberById(input_id);
		
		
		if(mb == null) { 
			
			try {
				out = response.getWriter();
				out.println("<script>alert('해당 아이디가 존재하지 않습니다.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			mav.setViewName(getPage);
			
		}else { 
			System.out.println("가입한 회원");
			if (mb.getPw().equals(input_password)) {
				// �α���
				session.setAttribute("loginInfo", mb);
				
				String destination = (String)session.getAttribute("destination");
				System.out.println("destination: "+destination);
				
				if(destination == null) {
					mav.setViewName(gotoPage);
				}else {
					mav.setViewName(destination);
				}

			} else { 
				
				try {
					out = response.getWriter();
					out.println("<script>alert('비번이 일치하지 않습니다.');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}

				mav.setViewName(getPage);
			}
		}

		return mav;
	}
}
