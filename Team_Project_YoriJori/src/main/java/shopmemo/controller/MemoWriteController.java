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
	public String doAction(@ModelAttribute("memobean") MemoBean memobean, Model model, HttpSession session,
						HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		
		if(memobean.getMemotask() == "") {		//�޸� ����
			out = response.getWriter();
			out.println("<script>alert('�޸� �ۼ��ϼ���'); history.go(-1);</script>");
			out.flush();
			return gotoPage;
		}else {
			int cnt = memodao.writeMemo(memobean);
			
			if(cnt!=-1) {
	        	System.out.println("�޸� ���� ����");
	        	request.setAttribute("msg", "�ۼ��Ͻ� �޸� �߰��Ǿ����ϴ�.");
				request.setAttribute("url", "/ex/page.ref");
	        }else {
	        	System.out.println("�޸� ���� ����");
	        }
		}
	
		model.addAttribute("loginInfo", loginInfo);
		
		return "alert";
	}
	
}
