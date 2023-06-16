package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberDao;
import member.model.StopBean;

@Controller
public class AdminStopListController {
	private final String command = "/mbStopList.am";
	private final String getPage = "am_mbstopList";
	
	@Autowired
	MemberDao mdao;
	

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model) {
		
		List<StopBean> lists= mdao.getAllStop();
		
		model.addAttribute("lists",lists);
		
		return getPage;
	}
}

