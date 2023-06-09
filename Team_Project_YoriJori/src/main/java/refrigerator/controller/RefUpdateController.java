package refrigerator.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ingredient.model.IngDao;
import member.model.MemberBean;
import refrigerator.model.JoinBean;
import refrigerator.model.RefBean;
import refrigerator.model.RefDao;

@Controller
public class RefUpdateController {
	private final String command = "/update.ref";
	private String getPage = "updateRefrigerator";
	private String gotoPage = "redirect:/list.ref";
	
	@Autowired
	IngDao ingdao;
	@Autowired
	RefDao refdao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(@RequestParam("ingnum") int ingnum, Model model, HttpSession session) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		String id = loginInfo.getId();
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("ingnum", Integer.toString(ingnum));
		
		JoinBean joinbean = new JoinBean();
		joinbean = refdao.getRefDetail(map);
		
		model.addAttribute("loginInfo", loginInfo);
		model.addAttribute("joinbean", joinbean);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String update(@ModelAttribute("refbean") RefBean refbean, Model model, HttpSession session, HttpServletRequest request) {
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			int cnt = refdao.updateRef(refbean);
			
			if(cnt!=-1) {
				System.out.println("update 성공");
				request.setAttribute("msg", "해당 식재료 정보 수정을 완료했습니다.");
				request.setAttribute("url", "/ex/list.ref");
			}
			
			model.addAttribute("loginInfo", loginInfo);
			return "alert";
	}
		
}
	
	
