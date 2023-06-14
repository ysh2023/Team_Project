package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;

@Controller
public class BoardDeleteController {
	private final String command = "boardDelete.board";
	private String page = "redirect:/main.board";

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam("bodNum") String bodNum, HttpSession session) {
		int result = bdao.deleteBoardByBodNum(bodNum);
		return page;
	}
}
