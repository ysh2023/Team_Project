package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import order.model.OrderBean;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class AdminOrdertListController {
	private final String command = "/ordList.am";
	private String getPage = "am_orderList";
	
	@Autowired
	@Qualifier("myAdminDao")
	AdminDao adao;
	
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<OrderBean> lists = adao.getAllOrder(); 
		mav.addObject("lists", lists);
		mav.setViewName(getPage);
		
		return mav; 
		
	}

}
