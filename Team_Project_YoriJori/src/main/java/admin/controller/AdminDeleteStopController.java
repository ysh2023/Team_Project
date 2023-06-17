package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class AdminDeleteStopController {
	private final String command = "/deleteStop.am";
	private final String getPage = "redirect:/mbStopList.am";
	
	@Autowired
	MemberDao mdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("id") String id) {
		
		mdao.deleteStop(id);
		
		return getPage;
	}
}
