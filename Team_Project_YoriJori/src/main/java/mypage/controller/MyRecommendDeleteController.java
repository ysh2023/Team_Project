package mypage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import mypage.model.MyDao;

@Controller
public class MyRecommendDeleteController {
	private final String command = "deleteRecommend.mp";
	private String loginPage = "login.mb";

	@Autowired
	MyDao mdao;

	@RequestMapping(value = command)
	public void doAction(@RequestParam(value = "recNum") String recNum, Model model, HttpSession session,
			HttpServletResponse response) {
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
		} else {
			id = ((MemberBean) session.getAttribute("loginInfo")).getId();
			int result = mdao.deleteMyRecommend(recNum);
			if (result > 0) {
				try {
					response.getWriter().append("<script>alert('추천 취소 성공');location.href='myRecommend.mp';</script>")
							.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				try {
					response.getWriter().append("<script>alert('추천 취소 실패');location.href='myRecommend.mp'</script>")
							.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
