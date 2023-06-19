package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import order.model.OrderBean;
import order.model.OrderDao;

@Controller
public class MypageOrderListContoroller {
	private final String command = "/orderlist.mp";
	private String getPage = "mypageorderList";
	
	@Autowired
	OrderDao odao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(HttpSession session) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		List<OrderBean> slist = odao.getByIdOrder(loginInfo.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		mav.addObject("slist", slist);
		return mav;  
	} 

}