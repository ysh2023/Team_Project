package refrigerator.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ingredient.model.IngBean;
import ingredient.model.IngDao;
import member.model.MemberBean;
import refrigerator.model.JoinBean;
import refrigerator.model.RefBean;
import refrigerator.model.RefDao;

@Controller
public class RefInsertController {
	private final String command = "/insert.ref";
	private String getPage = "insertRefrigerator";
	private String gotoPage = "redirect:/page.ref";

	@Autowired
	IngDao ingdao;

	@Autowired
	RefDao refdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "arrange", required = false) String arrange,
			@RequestParam(value = "storage", required = false) String storage, Model model, HttpSession session) {

		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", loginInfo.getId());
		map.put("arrange", arrange);
		List<RefBean> allList = refdao.getUserRef(map);

		IngBean userIng = ingdao.getIngInfo(1);
		
		List<IngBean> ingList1 = ingdao.getIngbyCtg("곡류/콩/견과류");
		List<IngBean> ingList2 = ingdao.getIngbyCtg("계란/유제품");
		List<IngBean> ingList3 = ingdao.getIngbyCtg("채소");
		List<IngBean> ingList4 = ingdao.getIngbyCtg("과일");
		List<IngBean> ingList5 = ingdao.getIngbyCtg("정육/해산물");
		List<IngBean> ingList6 = ingdao.getIngbyCtg("면/빵/떡");
		List<IngBean> ingList7 = ingdao.getIngbyCtg("소스/오일");
		List<IngBean> ingList8 = ingdao.getIngbyCtg("기타");
		
		model.addAttribute("loginInfo", loginInfo);
		model.addAttribute("storage", storage);
		model.addAttribute("allList", allList);

		model.addAttribute("userIng", userIng);

		model.addAttribute("ingList1", ingList1);
		model.addAttribute("ingList2", ingList2);
		model.addAttribute("ingList3", ingList3);
		model.addAttribute("ingList4", ingList4);
		model.addAttribute("ingList5", ingList5);
		model.addAttribute("ingList6", ingList6);
		model.addAttribute("ingList7", ingList7);
		model.addAttribute("ingList8", ingList8);
		
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String insert(@RequestParam("rowchk") int[] rowchk, @RequestParam("refstorage") String refstorage,
			Model model, HttpSession session, HttpServletRequest request) {
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
		String id = loginInfo.getId();

		int cnt = -1;
		for (int i = 0; i < rowchk.length; i++) {
			System.out.println("check: " + rowchk[i]);

			RefBean refbean = new RefBean();
	        refbean.setId(id);
	        refbean.setIngnum(rowchk[i]);
	        refbean.setRefstorage(refstorage);
	        if(rowchk[i]==1) {
	        	//System.out.println("사용자: "+refbean.getRefdetail());
	        	if(refbean.getRefdetail() == null) {
	        		refbean.setRefdetail("직접 입력");
	        	}
	        	
	        	//System.out.println("사용자: "+refbean.getRefdetail());
	        }else {
	        	refbean.setRefdetail("");
	        }
	        
	        
	    
        	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
        	Date now = new Date();	//sysdate(재료 추가일)
        	Calendar cal = Calendar.getInstance();
        	cal.setTime(now);
        	
        	IngBean ingbean = ingdao.getIngInfo(rowchk[i]);
        	cal.add(Calendar.DATE, ingbean.getExpiry());		//현재 날짜에 소비일 더하기
        	String refdday = simpleDate.format(cal.getTime());
        	
        	refbean.setRefdday(refdday);
        	
        	cnt += refdao.insertRef(refbean);
		}
        
        if(cnt!=-1) {
        	
        	System.out.println("냉장고 insert 성공");
        	request.setAttribute("msg", "선택하신 식재료가 냉장고에 추가되었습니다.");
			request.setAttribute("url", "/ex/page.ref");
        }else {
        	System.out.println("냉장고 insert 실패");
        }

		model.addAttribute("loginInfo", loginInfo);
		return "alert";
	}

}
