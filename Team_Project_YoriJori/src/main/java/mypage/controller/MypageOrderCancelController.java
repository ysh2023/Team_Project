package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import order.model.OrderDao;
import orderdetail.model.OrderDetailDao;

@Controller
public class MypageOrderCancelController {
	private final String command="/cancelpay.mp";
	private String page = "redirect:/orderlist.mp";
	@Autowired
	OrderDao odao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("merchant_uid") String merchantuid,
			Model model, HttpServletRequest request,HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		result = odao.updatePaystate(merchantuid);
		response.setContentType("text/html; charset=utf-8;");
		if(result>0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('환불요청되었습니다.'); location.href='orderlist.mp';</script>");
			out.flush();
			mav.setViewName(page);
		}
		return mav; 
		
	}
}
