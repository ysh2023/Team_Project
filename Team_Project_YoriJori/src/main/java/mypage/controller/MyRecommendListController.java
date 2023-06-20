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
public class MyRecommendListController {
	private final String command = "/myRecommend.mp";
	private String page = "myRecommend";

	@Autowired
	MyDao mdao;

	@RequestMapping(value = command)
	public String doAction(Model model, HttpSession session, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		String id = null;
		if (((MemberBean) session.getAttribute("loginInfo")) == null) {
			try {
				response.getWriter().append("<script>alert('로그인 후 이용할 수 있습니다');location.href='login.mb';</script>")
						.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		} else {
			id = ((MemberBean) session.getAttribute("loginInfo")).getId();
			model.addAttribute("recommendList", mdao.getAllMyRecommend(id));
			return page;
		}
	}
}
