package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import order.model.OrderDao;
import orderdetail.model.OrderDetailDao;

@Controller
public class AdminCancelPayOrderController {
	private final String command="/adminCancelPayOrd.am";
	private String page = "redirect:/ordercancel.am";
	@Autowired
	@Qualifier("myAdminDao")
	AdminDao adao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("ordnum") String merchantuid,
			Model model, HttpServletRequest request,HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		result = adao.ApproveCancelpay(merchantuid);
		response.setContentType("text/html; charset=utf-8;"); 
		if(result>0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('환불승인되었습니다.'); location.href='ordercancel.am';</script>");
			out.flush();
			mav.setViewName(page);
		}
		return mav; 
		
	}
}
