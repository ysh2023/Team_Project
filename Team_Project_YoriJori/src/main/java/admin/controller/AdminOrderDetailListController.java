package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import orderdetail.model.OrderDetailBean;

@Controller
public class AdminOrderDetailListController {
	private final String command = "/orderdetailList.am";
	private String getPage = "am_orderDetailList";
	
	@Autowired
	@Qualifier("myAdminDao")
	AdminDao adao;
	
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(Model model, HttpServletRequest request,
			@RequestParam("ordnum") String ordnum) {
		ModelAndView mav = new ModelAndView();
		List<OrderDetailBean> lists = adao.getAllOrderDetail(ordnum);
		mav.addObject("lists", lists);
		mav.setViewName(getPage);
		 
		return mav; 
		
	}

}