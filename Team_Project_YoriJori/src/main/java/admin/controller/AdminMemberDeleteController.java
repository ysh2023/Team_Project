package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import member.model.MemberDao;

@Controller
public class AdminMemberDeleteController {
	
	
	private final String command = "/deleteMb.am";
	private final String getPage = "redirect:mbList.am";
	
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	AdminDao adao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("id") String id) {
		
		
		
		mdao.deleteMember(id);
		

		
		
		return getPage;
	}
}

