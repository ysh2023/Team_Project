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

@Controller
public class BoardCommentsDeleteController {
	private final String command = "deleteComments.board";
	private String page = "commentsUpdate";

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam("bodNum") String bodNum, @RequestParam("comNum") String comNum,
			HttpServletResponse response, HttpSession session, Model model) throws IOException {
		int result = bdao.deleteCommentByComNum(comNum);
		response.setContentType("text/html; charset=utf-8;");
		model.addAttribute("commentsList", bdao.getCommentByBodNum(bodNum));
		model.addAttribute("bodNum", bodNum);

		if (result > 0) {
			response.getWriter().append("<Script>alert('댓글이 삭제되었습니다');</Script>").flush();
			return page;

		} else {
			response.getWriter().append("<Script>alert('댓글 삭제 실패');</Script>").flush();
			return page;

		}
	}

}
