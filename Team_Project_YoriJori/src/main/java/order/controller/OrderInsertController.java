package order.controller;


import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.aop.aspectj.AspectJMethodBeforeAdvice;
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
import order.model.OrderBean;
import order.model.OrderDao;
import orderdetail.map.DetailList;
import orderdetail.model.OrderDetailBean;
import orderdetail.model.OrderDetailDao;
import product.model.ProductDao;

@Controller
public class OrderInsertController {
	private final String command="/orderinsert.ord";
	private final String getPage="redirect:/";
	
	@Autowired
	OrderDao odao;
	
	@Autowired
	BasketDao bdao;
	
	@Autowired 
	ProductDao pdao;
	
	@Autowired
	OrderDetailDao odtdao;
	   
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
		ob.setOrdtotalpay(amount);
		ob.setOrdemail(buyeremail);
		ob.setOrdname(buyername);
		ob.setOrdtel(buyertel);
		ob.setOrdaddr(buyeraddr);
		ob.setOrdzipcode(buyerpostcode);
		ob.setOrdmemid(loginInfo.getId());
		System.out.println("사람이름:"+ob.getOrdname());
		int cnt = -1;
		int cnt2 = -1;
		cnt = odao.insertOrder(ob);
		if(cnt > -1) {//결제 db 성공시
			DetailList detail = (DetailList)session.getAttribute("detail");
			Map<Integer,Integer> mapLists = detail.getAllorderLists();
			Set<Integer> keylist = mapLists.keySet();
			for( Integer key : keylist) {
				OrderDetailBean odt =  new OrderDetailBean();
				odt.setOdtid(loginInfo.getId());
				odt.setOdtordnum(merchantuid);
				odt.setOdtpdnum(key);
				odt.setOdtqty(mapLists.get(key));
				odt.setOdtprice(amount);
				cnt2 += odtdao.insertOrderDetail(odt);
				System.out.println("장바구니cnt2:"+cnt2);
				//상품 재고수량 감소
				int stock_cnt = pdao.updatePqty(odt.getOdtpdnum(),odt.getOdtqty());
			}
			detail.deleteOrder();
			System.out.println("장바구니cnt:"+cnt2);
			if(cnt2>0) {
			bdao.deleteIdBasket(loginInfo.getId()); // 장바구니 삭제
			}
			System.out.println("insertOrder 성공");
		}else {
			System.out.println("insertOrder 실패");
		}
		
		return getPage;  
	}
}
 