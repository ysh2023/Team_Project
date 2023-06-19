package mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import mypage.model.DibsDao;

@Controller
public class MypageDeleteDibsController {
	private final String command = "/deleteDibs.mp";
	private String getPage = "redirect:listDibs.mp";
	
	@Autowired
	DibsDao ddao;
	

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("pdnum") String pdnum,HttpSession session) {
		String id=((MemberBean)session.getAttribute("loginInfo")).getId();
		
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("pdnum", pdnum);
		map.put("id",id);
		
		ddao.deleteDibs(map);
		
		return getPage;
	}
	
}
