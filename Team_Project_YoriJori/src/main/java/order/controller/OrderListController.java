package order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import order.model.OrderDao;
import orderdetail.model.OrderDetailDao;

@Controller
public class OrderListController {
	private final String command="/list.ord";
	private final String getPage="memberorderList";
	
	@Autowired
	OrderDao odao;
	
	@Autowired
	OrderDetailDao odtdao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(
			Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		return mav; 
		
	}
}