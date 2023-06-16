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
	private final String page = "redirect:/boardDetail.board";

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	public void doAction(@RequestParam("bodNum") String bodNum, @RequestParam("comNum") String comNum,
			HttpServletResponse response, HttpSession session, Model model) throws IOException {
		int result = bdao.deleteCommentByBodNum(comNum);
		System.out.println(bodNum + "delete");
		response.setContentType("text/html; charset=utf-8;");
		if (result > 0) {
			response.getWriter().append(
					"<Script>alert('댓글이 삭제되었습니다');location.href='boardDetail.board?bodNum=" + bodNum + "';</Script>")
					.flush();

		} else {
			response.getWriter().append("<Script>alert('댓글 삭제 실패');history.back();</Script>").flush();

		}
	}

}
