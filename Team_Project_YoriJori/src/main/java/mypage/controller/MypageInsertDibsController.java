package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import mypage.model.DibsBean;
import mypage.model.DibsDao;

@Controller
public class MypageInsertDibsController {
	private final String command = "/insertDibs.mp";
	private final String getPage = "redirect:/shop.prd";

	
	@Autowired
	DibsDao ddao;
	

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("pdnum") String pdnum,HttpSession session,HttpServletResponse response,
			@RequestParam(value = "pageNumber",required = false) String pageNumber,Model model,@RequestParam(value = "ck",required = false) String ck 
			) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		
		if(session.getAttribute("loginInfo") == null) {	
			if(ck==null) {
			session.setAttribute("destination", "redirect:/shop.prd?whatColumn=no");	
			}
			else {
				session.setAttribute("destination", "redirect:/");
			}
			return "redirect:/login.mb";
		}else {
		
		String id=((MemberBean)session.getAttribute("loginInfo")).getId();
		
		int totalCount=0;
				
		totalCount=ddao.getTotalCount(id);

		
		if(totalCount<=20) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pdnum", pdnum);
		
		
		DibsBean dbean=ddao.getDibsByNum(map);
		if(dbean==null) {
			try {
				out = response.getWriter();
				out.println("<script>alert('찜에 담았습니다');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			ddao.insertDibs(map);
		}else {
			try {
				out = response.getWriter();
				out.println("<script>alert('해당상품은 이미 찜에 담겨있습니다');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		}
		
		else {
			try {
				out = response.getWriter();
				out.println("<script>alert('찜이 너무 많습니다 정리하시고 다시 담아주세요');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
		
	}
		
	}
}
