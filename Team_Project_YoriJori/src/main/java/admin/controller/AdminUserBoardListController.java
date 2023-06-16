package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.model.BoardDao;

@Controller
public class AdminUserBoardListController {
	private final String command = "userBoard.am";
	private String page = "user_board/am_userBoardList";

	@Autowired
	BoardDao dao;

	@RequestMapping(value = command)
	public String doAction(Model model) {

		return page;
	}

}
