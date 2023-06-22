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
	public String update(@RequestParam(value="memonum",required = false) int[] memonum_arr,
						@RequestParam(value="myscroll",required=false) String myscroll,
						@RequestParam(value="destination",required=false) String destination,
						Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			String id = loginInfo.getId();
			
			if(myscroll != null) {
				model.addAttribute("modelscroll", myscroll);
			}
			
			int cnt = -1;
			boolean flag = false;
			List<MemoBean> userMemo = memodao.getUserMemo(id);
			
			if(userMemo.isEmpty()) {
				request.setAttribute("msg", "메모를 작성하세요");
				
				if(destination.equals("ref")) {
	        		request.setAttribute("url", "/ex/page.ref?myscroll="+myscroll);
	        	}else if(destination.equals("prd")) {
	        		request.setAttribute("url", "/ex/shop.prd?myscroll="+myscroll);
	        	}
				
			}else {
				for(MemoBean memobean : userMemo) {
					//System.out.println("memonum: "+memobean.getMemonum());
					Map<String,Integer> map = new HashMap<String,Integer>();
					map.put("memonum", memobean.getMemonum());
					
					if(memonum_arr != null) {
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
						
					}else {
						map.put("memoflag", 0);
					}
					
					cnt += memodao.updateMemo(map);
					flag = false;
				}
				
				if(cnt!=-1) {
					System.out.println("메모 update 성공");
					request.setAttribute("msg", "메모 저장을 완료했습니다.");
					
					if(destination.equals("ref")) {
		        		request.setAttribute("url", "/ex/page.ref?myscroll="+myscroll);
		        	}else if(destination.equals("prd")) {
		        		request.setAttribute("url", "/ex/shop.prd?myscroll="+myscroll);
		        	}
				}
				
			}
			
			model.addAttribute("loginInfo", loginInfo);
			return "alert";
			
	}
			
			
}
		

	
	
