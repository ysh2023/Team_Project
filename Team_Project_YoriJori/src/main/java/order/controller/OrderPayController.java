package order.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.JBoss6VFS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import basket.model.BasketDao;
import basket.model.JoinBean;
import member.model.MemberBean;
import member.model.MemberDao;
import order.model.OrderDao;

@Controller
public class OrderPayController {
	private final String command="/orderpay.ord";
	private final String getPage="orderPay";
	
	@Autowired
	OrderDao odao; 
	
	@Autowired
	BasketDao bdao;
	
	@Autowired
	MemberDao mdao;
	 
	//Get은 BasketList에서 요청을하고
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(@RequestParam("totalAmount") int totalAmount,Model model
			,HttpSession session) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		List<JoinBean> slist = bdao.getBasketList(loginInfo.getId());
		MemberBean mb = mdao.GetMemberById(loginInfo.getId());
		String buyname = mb.getMname();
		String ordpdname = "";
		for(int i=0;i<slist.size();i++) {
			ordpdname += (slist.get(i).getPdname()+",");
		}
		//끝에 , 제거
		ordpdname = ordpdname.replaceAll(",$", "");
		System.out.println("ordpdname1:"+ordpdname);
		model.addAttribute("buyname", buyname);
		model.addAttribute("ordpdname", ordpdname);
		model.addAttribute("slist", slist);
		model.addAttribute("totalAmount", totalAmount);
		return getPage; 
		
	}
	//Post는 prdDetail에서 요청을 한다.
	@RequestMapping(value=command,method = RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam("pdname") String pdname,
			@RequestParam("pdprice") int pdprice,
			@RequestParam("qty") int qty,HttpSession session,HttpServletResponse response
			) {
		ModelAndView mav = new ModelAndView();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		JoinBean jb = new JoinBean();
		if(loginInfo == null) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 후 이용 가능합니다.'); location.href='login.mb';</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			mav.setViewName("redirect:/login.mb");
			return mav;
		}else {
			jb.setPdname(pdname);
			jb.setPdprice(pdprice);
			jb.setBskqty(qty);
			List<JoinBean> slist = new ArrayList<JoinBean>();
			slist.add(jb);
			int totalAmount = (pdprice*qty);
			System.out.println("ordpdname2:"+pdname);
			mav.addObject("ordpdname", pdname);
			mav.addObject("slist", slist);
			mav.addObject("qty", qty);
			mav.addObject("totalAmount", totalAmount);
			mav.setViewName(getPage);
			return mav; 
		}
		
	}
}
 