package shopmemo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import shopmemo.model.MemoBean;
import shopmemo.model.MemoDao;

@Controller
public class MemoUpdateController {
	private final String command = "/update.memo";
	private String gotoPage = "redirect:/page.ref";
	
	@Autowired
	MemoDao memodao;
	
	@RequestMapping(value=command)
	public String update(@RequestParam("memonum") int[] memonum_arr, Model model, HttpSession session,
						HttpServletRequest request, HttpServletResponse response) {
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			String id = loginInfo.getId();
			
			int cnt = -1;
			boolean flag = false;
			List<MemoBean> userMemo = memodao.getUserMemo(id);
			
			for(MemoBean memobean : userMemo) {
				//System.out.println("memonum: "+memobean.getMemonum());
				Map<String,Integer> map = new HashMap<String,Integer>();
				map.put("memonum", memobean.getMemonum());
				
				for(int i=0; i<memonum_arr.length; i++) {
					//System.out.println("checked memonum: "+memonum_arr[i]);
					if(memobean.getMemonum() == memonum_arr[i]) {
						flag = true;
					}
				}
				
				if(flag == true) {
					map.put("memoflag", 1);
				}else {
					map.put("memoflag", 0);
				}
				
				cnt += memodao.updateMemo(map);
				flag = false;
			}
			
			if(cnt!=-1) {
				System.out.println("�޸� update ����");
				request.setAttribute("msg", "�޸� ������ �Ϸ��߽��ϴ�.");
				request.setAttribute("url", "/ex/page.ref");
			}
			
			model.addAttribute("loginInfo", loginInfo);
			return "alert";
	}
			
			
}
		

	
	
