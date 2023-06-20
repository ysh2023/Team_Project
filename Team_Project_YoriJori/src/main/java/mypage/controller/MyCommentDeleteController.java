package mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
public class MyCommentDeleteController {
	private final String command = "deleteComment.mp";

	@Autowired
	MyDao mdao;

	@RequestMapping(value = command)
	public void doAction(@RequestParam("comNum") String comNum, Model model, HttpSession session,
			HttpServletResponse response) {
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
		} else {
			System.out.println("3333");
			id = ((MemberBean) session.getAttribute("loginInfo")).getId();
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("comNum", comNum);
			int result = mdao.deleteMyComment(map);
			if (result > 0) {
				try {
					response.getWriter().append("<script>alert('댓글 삭제 성공');location.href='myComment.mp';</script>")
							.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				try {
					response.getWriter().append("<script>alert('댓글 삭제 실패');location.href='myComment.mp';</script>")
							.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}
	}
}
