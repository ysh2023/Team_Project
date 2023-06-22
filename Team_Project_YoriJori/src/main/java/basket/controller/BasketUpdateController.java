package basket.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import basket.model.BasketBean;
import basket.model.BasketDao;
import basket.model.JoinBean;
import member.model.MemberBean;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class BasketUpdateController {
	private final String command="/update.bsk";
	private final String gotoPage="redirect:list.bsk";
	
	@Autowired
	BasketDao bdao;
	
	@Autowired
	ProductDao pdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="bsknum") int bsknum,
			@RequestParam(value="qty") int qty,
			Model model, HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		BasketBean bb2  = bdao.getByNumBasket(bsknum);
		System.out.println("bskpdnum:"+bb2.getBskpdnum());
		ProductBean pb = pdao.getByNum(bb2.getBskpdnum());
		if(pb.getPdstock() < qty) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('구매수량이 재고수량보다 많습니다.'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			BasketBean bb = new BasketBean();
			bb.setBsknum(bsknum);
			bb.setBskqty(qty);
			int cnt = bdao.updateBasket(bb);
			if(cnt > 1) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제실패");
			}
			mav.setViewName(gotoPage);
		}
		return mav;
	}
}
