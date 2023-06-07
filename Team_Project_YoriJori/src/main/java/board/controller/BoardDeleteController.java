package board.controller;

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
	public String doAction(@RequestParam("bodNum") String bodNum) {
		int result = bdao.deleteBoardByBodNum(bodNum);
		return page;
	}
}
