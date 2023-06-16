package board.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import board.model.CommentsBean;

@Controller
public class BoardCommentsUpdateController {
	private final String command = "updateComments.board";
	private String page = "commentsUpdate";

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam("bodNum") String bodNum, @RequestParam("comContent") String comContent,
			@RequestParam("comNum") String comNum, HttpServletResponse response, HttpSession session, Model model)
			throws IOException {
		CommentsBean commentsBean = new CommentsBean();
		commentsBean.setComNum(Integer.parseInt(comNum));
		commentsBean.setComContent(comContent);
		int result = bdao.updateCommentByBodNum(commentsBean);
		response.setContentType("text/html; charset=utf-8;");
		model.addAttribute("commentsList", bdao.getCommentByBodNum(bodNum));
		model.addAttribute("bodNum", bodNum);
		if (result > 0) {
			response.getWriter().append("<Script>alert('수정되었습니다');</Script>").flush();
			return page;
		} else {
			response.getWriter().append("<Script>alert('수정 실패');</Script>").flush();
			return page;

		}
	}

}
