package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;

@Controller
public class BoardDetailController {
	private final String command = "boardDetail";
	private String page = "boardDetail";

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	public String doAction(Model model, @RequestParam(value = "bodNum") String bodNum) {
		model.addAttribute("board", bdao.getBoardByBodNum(bodNum));
		model.addAttribute("boardContentList", bdao.getBoardContentByBodNum(bodNum));
		model.addAttribute("comments", bdao.getCommentByBodNum(bodNum));
		return page;
	}
}
