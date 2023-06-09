package order.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import basket.model.BasketDao;
import member.model.MemberBean;
import order.model.OrderBean;
import order.model.OrderDao;

@Controller
public class OrderInsertController {
	private final String command="/orderinsert.ord";
	private final String getPage="./../../main";
	
	@Autowired
	OrderDao odao;
	
	@Autowired
	BasketDao bdao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(HttpSession session,@RequestParam("name") String name, //상품 이름
			@RequestParam("merchant_uid") String merchantuid, //주문 번호
			@RequestParam("amount") int amount,// 결제 가격
			@RequestParam("buyer_email") String buyeremail, //구매자 이메일
			@RequestParam("buyer_name") String buyername,//구매자 이름
			@RequestParam("buyer_tel") String buyertel,//구매자 전화번호
			@RequestParam("buyer_addr") String buyeraddr,//구매자 주소
			@RequestParam("buyer_postcode") String buyerpostcode//구매자 우편번호
			) {
		System.out.println("name:"+name);
		System.out.println("merchantuid:"+merchantuid);
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		OrderBean ob = new OrderBean();
		ob.setOrdnum(merchantuid);
		ob.setOrdpdname(name);
		ob.setOrdtotalprice(amount);
		ob.setOrdemail(buyeremail);
		ob.setOrdname(buyername);
		ob.setOrdtel(buyertel);
		ob.setOrdaddr(buyeraddr);
		ob.setOrdzipcode(buyerpostcode);
		ob.setOrdmemid(loginInfo.getId());
		
		int cnt = -1;
		cnt = odao.insertOrder(ob);
		if(cnt > -1) {//결제 db 성공시
			int cnt2 = bdao.deleteIdBasket(loginInfo.getId());
			System.out.println("cnt2:"+cnt2);
			System.out.println("insertOrder 성공");
		}else {
			System.out.println("insertOrder 실패");
		}
		
		return getPage; 
	}
	/*
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(
			@RequestParam("name") String name,
			@RequestParam("merchant_uid") int merchantuid,HttpSession session
			) {
		System.out.println("merchantuid:"+merchantuid);
		System.out.println("name:"+name);
		return getPage; 
		
	}
	*/
}
 