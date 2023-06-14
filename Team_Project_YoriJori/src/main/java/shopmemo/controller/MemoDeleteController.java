package shopmemo.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import shopmemo.model.MemoDao;


@Controller
public class MemoDeleteController {
	private final String command = "/delete.memo";
	
	@Autowired
	MemoDao memodao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(@RequestParam("memonum") int memonum, Model model, HttpSession session, HttpServletRequest request) throws SQLException {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		String id = loginInfo.getId();
		
		int cnt = -1;
		cnt = memodao.deleteMemo(memonum);
		
		if(cnt!=-1) {
			System.out.println("메모 delete 성공");
			request.setAttribute("msg", "해당 메모를 삭제했습니다.");
			request.setAttribute("url", "/ex/page.ref");
		}
		
		model.addAttribute("loginInfo", loginInfo);
		return "alert";
	}
	
}