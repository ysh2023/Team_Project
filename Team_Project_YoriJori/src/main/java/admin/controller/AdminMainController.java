package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;

@Controller
public class AdminMainController {
	private final String command = "/main.am";
	private final String getPage = "am_main";
	

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpSession session,HttpServletResponse response) {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		
		if((MemberBean)session.getAttribute("loginInfo")!=null) {
			String id=((MemberBean)session.getAttribute("loginInfo")).getId();
			if(id.equals("admin")) {
				System.out.print(id);
				return getPage;
			}else {
				try {
					out = response.getWriter();
					out.println("<script>alert('관리자화면은 관리자만 들어올 수 있습니다.');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				return "./../../main";
			}
		}
		else {
			try {
				out = response.getWriter();
				out.println("<script>alert('로그인을 진행해주세요.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:login.mb";
		}
		
		
	}

}
