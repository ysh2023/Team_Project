package refrigerator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RefListController {
	private final String command = "/list.ref";
	private String getPage = "userRefrigerator";
	private String gotoPage = "redirect:/login.main";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		
		if(session.getAttribute("loginInfo") == null) {	//�α��� ��������
			return gotoPage;	//�α��� ��������
		}else {
			return getPage;	//����� ��������
		}
		
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView insert() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
}
