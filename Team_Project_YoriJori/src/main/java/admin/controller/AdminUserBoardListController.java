package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.AdminDao;

@Controller
public class AdminUserBoardListController {
	private final String command = "/userBoard.am";
	private String page = "am_userBoardList";

	@Autowired
	AdminDao adao;

	@RequestMapping(value = command)
	public String doAction(Model model) {
		model.addAttribute("lists", adao.getAllBoardAm());
		return page;
	}

}
