package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;

@Controller
public class AdminUserBoardDeleteController {
	private final String command = "/deleteBoard.am";
	private String page = "redirect:/userBoard.am";

	@Autowired
	AdminDao adao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam(value = "bodNum") String bodNum, Model model) {
		adao.deleteBoard(bodNum);
		model.addAttribute("lists", adao.getAllBoardAm());
		return page;
	}

}
