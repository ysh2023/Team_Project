package refrigerator.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import refrigerator.model.RefBean;
import refrigerator.model.RefDao;

@Controller
public class RefListController {
	private final String command = "/list.ref";
	private String getPage = "userRefrigerator";
	private String gotoPage = "redirect:/login.mb";
	
	@Autowired
	RefDao refdao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(HttpSession session, Model model) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		if(session.getAttribute("loginInfo") == null) {	//�α��� ��������
			session.setAttribute("destination", "redirect:/list.ref");	//destination �Ӽ� ����
			return gotoPage;	//�α��� ��������
		}else {
			List<RefBean> refList = refdao.getUserRef(loginInfo.getId());
			
			model.addAttribute("refList",refList);
			model.addAttribute("loginInfo", loginInfo);
			return getPage;	//����� ��������
		}
		
	}
	
}
