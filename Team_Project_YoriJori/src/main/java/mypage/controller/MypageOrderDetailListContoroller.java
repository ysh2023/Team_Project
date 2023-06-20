package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import orderdetail.model.OrderDetailBean;
import orderdetail.model.OrderDetailDao;

@Controller
public class MypageOrderDetailListContoroller {
	private final String command = "/orderdetail.mp";
	private String getPage = "mypageorderDetailList";
	
	@Autowired
	OrderDetailDao odtdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(HttpSession session,
			@RequestParam("ordnum") String ordnum) {
		ModelAndView mav = new ModelAndView();
		List<OrderDetailBean> slist = odtdao.getByOrdnum(ordnum);
		mav.setViewName(getPage);
		mav.addObject("slist", slist);
		return mav;  
	} 

}