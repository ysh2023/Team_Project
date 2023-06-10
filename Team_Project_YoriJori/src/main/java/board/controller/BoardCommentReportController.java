package board.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import board.model.CommentReportBean;
import member.model.MemberBean;

@Controller
public class BoardCommentReportController {
	private final String command = "commentReport.board";

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	public void doAction(@RequestParam("comNum") String comNum, @RequestParam("reasons") String reasons,
			@RequestParam("repDiscription") String repDiscription, HttpSession session, HttpServletResponse response) {

		CommentReportBean commentReportBean = new CommentReportBean();
		commentReportBean.setReasons(reasons);
		commentReportBean.setComNum(Integer.parseInt(comNum));
		commentReportBean.setRepDiscription(repDiscription);
		commentReportBean.setId(((MemberBean) session.getAttribute("loginInfo")).getId());
		int result = bdao.insertCommentReport(commentReportBean);
		if (result > 0) {

			try {
				response.getWriter().append("�Ű� �����Ǿ����ϴ�.").flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().append("�Ű� �����߽��ϴ�.").flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}
