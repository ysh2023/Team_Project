package basket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import basket.model.BasketDao;
import basket.model.JoinBean;
import member.model.MemberBean;
import oracle.net.aso.s;

@Controller
public class BasketListController {
	private final String command="list.bsk";
	private final String getPage="basketList";
	
	@Autowired
	BasketDao bdao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(HttpSession session,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) { //로그인 안했을때
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 후 이용 가능합니다.'); location.href='login.mb';</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			mav.setViewName("redirect:/login.mb");
			return mav;
		}else { // 로그인 했을때
			List<JoinBean> slist = bdao.getBasketList(loginInfo.getId());
			int totalAmount = 0;
			for(int i=0;i<slist.size();i++) {
				totalAmount += (slist.get(i).getBskqty()* slist.get(i).getPdprice());
			}
			int Baesong = 0;
			if(totalAmount >= 50000) { //총 금액이 5만원 이상일시 배송비 무료
				Baesong = 0;
			}else { // 5만원 이하일시 배송비 3000원
				Baesong = 3000;
			}
			mav.addObject("Baesong", Baesong);
			mav.setViewName(getPage);
			mav.addObject("slist", slist);
			mav.addObject("totalAmount", totalAmount);
			return mav;
		}
	}
}
