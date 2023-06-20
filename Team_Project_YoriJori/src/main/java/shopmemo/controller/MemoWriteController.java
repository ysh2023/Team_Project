package shopmemo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import shopmemo.model.MemoBean;
import shopmemo.model.MemoDao;


@Controller
public class MemoWriteController {
	private final String command = "/write.memo";
	private String gotoPage = "redirect:/page.ref";
	
	@Autowired
	MemoDao memodao;
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String doAction(@RequestParam(value="myscroll",required=false) String myscroll,
						@RequestParam(value="destination",required=false) String destination,
						@ModelAttribute("memobean") MemoBean memobean, Model model, HttpSession session,
						HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		//System.out.println("memo scroll: "+myscroll);
		if(myscroll != null) {
			model.addAttribute("modelscroll", myscroll);
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		
		if(memobean.getMemotask() == "") {		//메모 누락
			out = response.getWriter();
			out.println("<script>alert('메모를 작성하세요'); history.go(-1);</script>");
			out.flush();
			return gotoPage;
		}else {
			int cnt = memodao.writeMemo(memobean);
			
			if(cnt!=-1) {
	        	System.out.println("메모 쓰기 성공");
	        	request.setAttribute("msg", "작성하신 메모가 추가되었습니다.");
	        	
	        	if(destination.equals("ref")) {
	        		request.setAttribute("url", "/ex/page.ref?myscroll="+myscroll);
	        	}else if(destination.equals("prd")) {
	        		request.setAttribute("url", "/ex/shop.prd?myscroll="+myscroll);
	        	}
				
	        }else {
	        	System.out.println("메모 쓰기 실패");
	        }
		}
	
		model.addAttribute("loginInfo", loginInfo);
		
		return "alert";
	}
	
}
