package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberLoginController {
	private final String command = "/login.mb";
	private String getPage = "loginForm";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction() {

		return getPage;
	}
	
}
