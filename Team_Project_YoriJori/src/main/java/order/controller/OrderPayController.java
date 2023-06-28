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

import basket.model.BasketBean;
import basket.model.BasketDao;
import basket.model.JoinBean;
import member.model.MemberBean;
import member.model.MemberDao;
import order.model.OrderDao;
import orderdetail.map.DetailList;
import product.model.ProductBean;
import product.model.ProductDao;

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
	
	@Autowired
	ProductDao pdao;
	 
	//Get은 BasketList에서 요청을하고
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(@RequestParam("totalAmount") int totalAmount,
			@RequestParam("Baesong") int Baesong,
			Model model,
			HttpSession session) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		List<JoinBean> slist = bdao.getBasketList(loginInfo.getId());
		MemberBean mb = mdao.GetMemberById(loginInfo.getId());
		String buyname = mb.getMname();
		String ordpdname = "";
		for(int i=0;i<slist.size();i++) {
			ordpdname += (slist.get(i).getPdname()+",");
		}
		// DetailList session 설정
		DetailList detail = (DetailList)session.getAttribute("detail");
		if(detail == null) {
			detail = new DetailList();
		}
		List<BasketBean> dlist = bdao.getBasketListB(loginInfo.getId());
		for(int i=0;i<dlist.size();i++) {
			detail.addOrder(dlist.get(i).getBskpdnum(),dlist.get(i).getBskqty());
		}
		session.setAttribute("detail", detail);
		
		ordpdname = ordpdname.replaceAll(",$", "");
		//상품이름 끝에 , 제거
		System.out.println("ordpdname1:"+ordpdname);
		model.addAttribute("Baesong", Baesong);
		model.addAttribute("mb", mb);
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
			@RequestParam("pdnum") int pdnum,
			@RequestParam("qty") int qty,HttpSession session,HttpServletResponse response
			) {
		ModelAndView mav = new ModelAndView();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		DetailList detail = (DetailList)session.getAttribute("detail");
		if(detail != null) {
			detail.deleteOrder();
		}
		ProductBean pb = pdao.getByNum(pdnum);
		//구매하기 눌렀을시 재고수량 체크
		if(pb.getPdstock() < qty) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('구매수량이 재고수량보다 많습니다.'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			
			JoinBean jb = new JoinBean();
			if(loginInfo == null) {
				session.setAttribute("destination", "redirect:/shop.prd?whatColumn=no&searchName=");	//destination 속성 설정
				mav.setViewName("redirect:/login.mb");
			}else {
				jb.setPdname(pdname);
				jb.setPdprice(pdprice);
				jb.setBskqty(qty);
				List<JoinBean> slist = new ArrayList<JoinBean>();
				slist.add(jb);
				
				// DetailList session 설정
				detail = (DetailList)session.getAttribute("detail");
				if(detail == null) {
					detail = new DetailList();
				}
					detail.addOrder(pdnum,qty);
				session.setAttribute("detail", detail);
				int totalAmount = (pdprice*qty);
				
				//배송비 추가
				int Baesong = 0; 
				if(totalAmount >= 50000) { 
					Baesong = 0;
				}else {
					Baesong = 3000;
				}
				System.out.println("ordpdname2:"+pdname);
				MemberBean mb = mdao.GetMemberById(loginInfo.getId());
				mav.addObject("mb", mb);
				mav.addObject("Baesong", Baesong);
				mav.addObject("ordpdname", pdname);
				mav.addObject("slist", slist);
				mav.addObject("qty", qty);
				mav.addObject("totalAmount", totalAmount);
				mav.setViewName(getPage);
			}
			
		}
		return mav;
	}
}
 