package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginKakaoController {

	private final String command = "/loginkakao.mb";
	private String getPage = "redirect:/";


	@Autowired
	MemberDao mdao;

		@RequestMapping(value = command, method = RequestMethod.GET)
		public String doAction(@RequestParam("profileNickname")String name,
				@RequestParam("accountEmail")String id,HttpSession session,
				HttpServletResponse response,Model model
				
				) throws ParseException {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;

			if(mdao.searchStopById(id)==false) {
		    System.out.println(name);
	        System.out.println(id);
	        
	        
	        if(mdao.GetMemberById(id)==null) {
	        	
	        	
	            MemberBean mb= new MemberBean();
	        	 mb.setId(id);
	        	 mb.setMname(name);
	        	model.addAttribute("mb",mb);
	        	
	        	return "registerForm";
	        	
	        }
	        
			}
			else {
				try {
					out = response.getWriter();
					out.println("<script>alert('정지회원입니다.');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			MemberBean mb2= mdao.GetMemberById(id);
			
			session.setAttribute("loginInfo", mb2);
	        
			String destination = (String)session.getAttribute("destination");
			System.out.println("destination: "+destination);
			
			if(destination == null) {
				return getPage;
			}else {
				return destination;
			}
			
		}
}
