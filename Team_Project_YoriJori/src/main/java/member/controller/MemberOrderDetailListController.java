package member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import order.model.OrderBean;
import order.model.OrderDao;
import orderdetail.model.OrderDetailBean;
import orderdetail.model.OrderDetailDao;

@Controller
public class MemberOrderDetailListController {
	private final String command = "/orderdetail.mb";
	private String getPage = "memberorderDetailList";
	
	@Autowired
	OrderDetailDao odtdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(HttpSession session,
			@RequestParam("ordnum") String ordnum) {
		ModelAndView mav = new ModelAndView();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		List<OrderDetailBean> slist = odtdao.getByOrdnum(ordnum);
		mav.setViewName(getPage);
		mav.addObject("slist", slist);
		return mav;  
	} 

}
