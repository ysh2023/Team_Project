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
	private final String getPage="./../../main";
	
	@Autowired
	OrderDao odao;
	
	@Autowired
	BasketDao bdao;
	
	@Autowired 
	ProductDao pdao;
	
	@Autowired
	OrderDetailDao odtdao;
	   
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(HttpSession session,@RequestParam("name") String name, //��ǰ �̸�
			@RequestParam("merchant_uid") String merchantuid, //�ֹ� ��ȣ
			@RequestParam("amount") int amount,// ���� ����
			@RequestParam("buyer_email") String buyeremail, //������ �̸���
			@RequestParam("buyer_name") String buyername,//������ �̸�
			@RequestParam("buyer_tel") String buyertel,//������ ��ȭ��ȣ
			@RequestParam("buyer_addr") String buyeraddr,//������ �ּ�
			@RequestParam("buyer_postcode") String buyerpostcode//������ �����ȣ
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
		System.out.println("����̸�:"+ob.getOrdname());
		int cnt = -1;
		int cnt2 = -1;
		cnt = odao.insertOrder(ob);
		if(cnt > -1) {//���� db ������
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
				//��ǰ ������ ����
				int stock_cnt = pdao.updatePqty(odt.getOdtpdnum(),odt.getOdtqty());
			}
			detail.deleteOrder();
			bdao.deleteIdBasket(loginInfo.getId()); // ��ٱ��� ����
			System.out.println("insertOrder ����");
		}else {
			System.out.println("insertOrder ����");
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
 