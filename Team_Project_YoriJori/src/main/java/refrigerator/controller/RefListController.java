package refrigerator.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String doAction(@RequestParam(value="arrange",required=false) String arrange, HttpSession session, Model model) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		if(session.getAttribute("loginInfo") == null) {	//�α��� ��������
			session.setAttribute("destination", "redirect:/list.ref");	//destination �Ӽ� ����
			return gotoPage;	//�α��� ��������
		}else {
			
			if(arrange == null) { //����
				arrange = "i.ing_name";
			}
			
			int totalCnt = refdao.getTotalCount(loginInfo.getId());
			int refCnt = refdao.getRefCount(loginInfo.getId());
			int freezeCnt = refdao.getFreezeCount(loginInfo.getId());
			int roomCnt = refdao.getRoomCount(loginInfo.getId());
			int ddayCnt = refdao.getDdayCount(loginInfo.getId());
			
			/* ��ü ����Ʈ */
			Map<String,String> listMap = new HashMap<String,String>();
			listMap.put("id", loginInfo.getId());
			listMap.put("arrange", arrange);

			List<RefBean> allList = refdao.getUserRef(listMap);
			
			/* ���庸�� ����Ʈ */
			Map<String,String> refMap = new HashMap<String,String>();
			refMap.put("id", loginInfo.getId());
			refMap.put("storage","����");
			refMap.put("arrange", arrange);

			List<RefBean> refList = refdao.getListbyStorage(refMap);
			
			/* �õ����� ����Ʈ */
			Map<String,String> freezeMap = new HashMap<String,String>();
			freezeMap.put("id", loginInfo.getId());
			freezeMap.put("storage","�õ�");
			freezeMap.put("arrange", arrange);

			List<RefBean> freezeList = refdao.getListbyStorage(freezeMap); 
			
			/* �ǿº��� ����Ʈ */
			Map<String,String> roomMap = new HashMap<String,String>();
			roomMap.put("id", loginInfo.getId());
			roomMap.put("storage","�ǿ�");
			roomMap.put("arrange", arrange);

			List<RefBean> roomList = refdao.getListbyStorage(roomMap); 
			
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
			
			return getPage;	//����� ��������
		}
		
	}
	
}
