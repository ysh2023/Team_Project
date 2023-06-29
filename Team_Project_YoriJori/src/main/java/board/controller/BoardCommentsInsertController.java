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
import member.model.MemberBean;

@Controller
public class BoardCommentsInsertController {
	private final String command = "insertComments.board";
	private String page = "commentsUpdate";

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam("bodNum") String bodNum, @RequestParam("comContent") String comContent,
			@RequestParam("comNum") String comNum, HttpServletResponse response, HttpSession session, Model model) {

		model.addAttribute("bodNum", bodNum);
		CommentsBean commentsBean = new CommentsBean();
		commentsBean.setComContent(comContent);
		commentsBean.setBodNum(Integer.parseInt(bodNum));
		commentsBean.setId(((MemberBean) session.getAttribute("loginInfo")).getId());

		if (comNum.equals("0")) {
			int result = bdao.insertComment(commentsBean);
			if (result > 0) {
				model.addAttribute("commentsList", bdao.getCommentByBodNum(bodNum));

			} else {
				try {
					response.getWriter().append("<script>alert('댓글 작성에 실패했습니다');</script>").flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} else {

			commentsBean = bdao.getCommentByComNum(comNum);
			int result = bdao.ReplyUpdateByBodNum(commentsBean);
//			int insertRefStep = bdao.getReplyInsertRefStep(commentsBean);

			if (result != -1) {

//				commentsBean.setRefStep(insertRefStep + 1);
				commentsBean.setRefStep(commentsBean.getRefStep() + 1);
				commentsBean.setRefLevel(commentsBean.getRefLevel() + 1);
				commentsBean.setComContent(comContent);
				commentsBean.setId(((MemberBean) session.getAttribute("loginInfo")).getId());
				int result2 = 0;
				result2 = bdao.insertReplyComment(commentsBean);
				if (result2 > 0) {
					model.addAttribute("commentsList", bdao.getCommentByBodNum(bodNum));
				}
			}

		}
		return page;

	}

}
