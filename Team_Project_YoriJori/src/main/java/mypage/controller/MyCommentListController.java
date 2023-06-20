package mypage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import mypage.model.MyDao;

@Controller
public class MyCommentListController {
	private final String command = "/myComment.mp";
	private String page = "myComment";

	@Autowired
	MyDao mdao;

	@RequestMapping(value = command)
	public String doAction(Model model, HttpSession session, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		System.out.println("1111111");
		String id = null;
		if (((MemberBean) session.getAttribute("loginInfo")) == null) {
			System.out.println("2222222");
			try {
				response.getWriter().append("<script>alert('로그인 후 이용할 수 있습니다');location.href='login.mb';</script>")
						.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		} else {
			System.out.println("3333");
			id = ((MemberBean) session.getAttribute("loginInfo")).getId();
			model.addAttribute("commentList", mdao.getAllMyComment(id));

			return page;
		}
	}
}
