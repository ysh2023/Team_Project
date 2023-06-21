package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberLogoutController {
	private final String command = "/logout.mb";
	private String getPage = "redirect:/";


	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		session.invalidate();
		
		
		return getPage;
	}
}
