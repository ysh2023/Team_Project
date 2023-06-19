package refrigerator.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import refrigerator.model.RefDao;


@Controller
public class RefDeleteController {
	private final String command = "/delete.ref";
	private String gotoPage = "redirect:/page.ref";
	
	@Autowired
	RefDao refdao;
	
	/* 수정폼에서 삭제 */
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(@RequestParam("refnum") int refnum, Model model, HttpSession session, HttpServletRequest request) throws SQLException {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		String id = loginInfo.getId();
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("refnum", Integer.toString(refnum));
		map.put("id", id);
		
		int cnt = -1;
		cnt = refdao.deleteRef(map);
		
		if(cnt!=-1) {
			//System.out.println("delete 성공");
			request.setAttribute("msg", "해당 식재료를 냉장고에서 삭제했습니다.");
			request.setAttribute("url", "/ex/page.ref");
		}
		
		model.addAttribute("loginInfo", loginInfo);
		return "alert";
	}
	
	/* 체크박스 선택 삭제 */
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String doAction(@RequestParam("rowchk") int[] rowchk, Model model, HttpSession session, HttpServletRequest request) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		String id = loginInfo.getId();
		
		int cnt = -1;
		for(int i=0;i<rowchk.length;i++) {
			System.out.println("check: "+rowchk[i]);
			Map<String,String> map = new HashMap<String,String>();
			map.put("refnum", Integer.toString(rowchk[i]));
			map.put("id", id);
			
			cnt += refdao.deleteRef(map);
		}
		
		if(cnt!=-1) {
			System.out.println("냉장고 delete 성공");
			request.setAttribute("msg", "선택하신 식재료가 삭제되었습니다.");
			request.setAttribute("url", "/ex/page.ref");
		}else {
			System.out.println("냉장고 delete 실패");
		}
		
		model.addAttribute("loginInfo", loginInfo);
		return "alert";
	}
		
}
	
	
