package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import basket.model.BasketDao;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private final String command = "/login.mb";
	private String getPage = "loginForm";
	private String gotoPage = "redirect:/";
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	BasketDao bdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		String destination = (String)session.getAttribute("destination");
		System.out.println("destination: "+destination);
		
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("id") String input_id, @RequestParam("password") String input_password,
			HttpServletResponse response, HttpSession session) throws ParseException {
		ModelAndView mav = new ModelAndView();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;

		MemberBean mb = mdao.GetMemberById(input_id);
		
		
		if(input_id.equals("") || input_password.equals("")) {
			try {
				out = response.getWriter();
				out.println("<script>alert('값이 제대로 입력되지 않았습니다.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			mav.setViewName(getPage);
			
		}else {
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
				if(mdao.searchStopById(input_id)==false)  { //정지회원아닐때
				session.setAttribute("loginInfo", mb);
				
				String id=((MemberBean)session.getAttribute("loginInfo")).getId();
				int bskcnt = bdao.BasketCount(id);
				if(bskcnt>0) {
					mav.addObject("bskcnt", bskcnt);
				}else {
					mav.addObject("bskcnt", 0);
				}
				session.setAttribute("bskcnt",bskcnt);
				mav.addObject("bskcnt", bskcnt);
				
				if(mb.getId().equals("admin")) {
					mav.setViewName("redirect:main.am");
				}else {
				
				String destination = (String)session.getAttribute("destination");
				System.out.println("destination: "+destination);
				
				if(destination == null) {
					mav.setViewName(gotoPage);
				}else {
					mav.setViewName(destination);
				}

			}}else{
				try {
					out = response.getWriter();
					out.println("<script>alert('정지회원입니다.');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}} else { 
				
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
		}
		session.removeAttribute("destination");
		return mav;
	}
}
