package refrigerator.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import refrigerator.model.JoinBean;
import refrigerator.model.RefBean;
import refrigerator.model.RefDao;
import shopmemo.model.MemoBean;
import shopmemo.model.MemoDao;

@Controller
public class RefPageController {
	private String getPage = "userRefrigerator";
	private String gotoPage = "redirect:/login.mb";
	
	@Autowired
	RefDao refdao;
	
	@Autowired
	MemoDao memodao;
	
	@RequestMapping(value="/page.ref")
	public String allList(@RequestParam(value="arrange",required=false) String arrange,
						@RequestParam(value="myscroll",required=false) String myscroll,
						Model model, HttpSession session, HttpServletRequest request) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		if(session.getAttribute("loginInfo") == null) {	//로그인 안했으면
			session.setAttribute("destination", "redirect:/page.ref");	//destination 속성 설정
			return gotoPage;	//로그인 페이지로
		}else {
			List<JoinBean> ddayList = refdao.getDdayIngList(loginInfo.getId());
			model.addAttribute("ddayList", ddayList);
			
			if(arrange == null) { //정렬
				arrange = "r.inputdate";	//기본정렬: 추가 날짜순
			}
			
			int totalCnt = refdao.getTotalCount(loginInfo.getId());
			int refCnt = refdao.getRefCount(loginInfo.getId());
			int freezeCnt = refdao.getFreezeCount(loginInfo.getId());
			int roomCnt = refdao.getRoomCount(loginInfo.getId());
			int ddayCnt = refdao.getDdayCount(loginInfo.getId());
			
			//System.out.println("scroll: "+myscroll);
			if(myscroll != null) {
				model.addAttribute("modelscroll", myscroll);
			}
			
			/* 전체 리스트 */
			Map<String,String> listMap = new HashMap<String,String>();
			listMap.put("id", loginInfo.getId());
			listMap.put("arrange", arrange);

			List<RefBean> allList = refdao.getUserRef(listMap);
			
			/* 냉장보관 리스트 */
			Map<String,String> refMap = new HashMap<String,String>();
			refMap.put("id", loginInfo.getId());
			refMap.put("storage","냉장");
			refMap.put("arrange", arrange);

			List<RefBean> refList = refdao.getListbyStorage(refMap);
			
			/* 냉동보관 리스트 */
			Map<String,String> freezeMap = new HashMap<String,String>();
			freezeMap.put("id", loginInfo.getId());
			freezeMap.put("storage","냉동");
			freezeMap.put("arrange", arrange);

			List<RefBean> freezeList = refdao.getListbyStorage(freezeMap); 
			
			/* 실온보관 리스트 */
			Map<String,String> roomMap = new HashMap<String,String>();
			roomMap.put("id", loginInfo.getId());
			roomMap.put("storage","실온");
			roomMap.put("arrange", arrange);

			List<RefBean> roomList = refdao.getListbyStorage(roomMap); 
			
			/* 장보기 메모 */
			List<MemoBean> userMemo = memodao.getUserMemo(loginInfo.getId());
			
			model.addAttribute("totalCnt",totalCnt);
			model.addAttribute("refCnt",refCnt);
			model.addAttribute("freezeCnt",freezeCnt);
			model.addAttribute("roomCnt",roomCnt);
			model.addAttribute("ddayCnt",ddayCnt);
			
			model.addAttribute("arrange", arrange);
			model.addAttribute("allList",allList);
			model.addAttribute("refList",refList);
			model.addAttribute("freezeList",freezeList);
			model.addAttribute("roomList",roomList);
			
			model.addAttribute("loginInfo", loginInfo);
			model.addAttribute("userMemo", userMemo);
			
			return getPage;	//냉장고 페이지로
			
		}
		
	}
	
}
