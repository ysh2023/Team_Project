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

@Controller
public class BasketUpdateController {
	private final String command="/update.bsk";
	private final String gotoPage="redirect:list.bsk";
	
	@Autowired
	BasketDao bdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="bsknum") int bsknum,
			@RequestParam(value="qty") int qty,
			Model model, HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		BasketBean bb = new BasketBean();
		bb.setBsknum(bsknum);
		bb.setBskqty(qty);
		int cnt = bdao.updateBasket(bb);
		if(cnt > 1) {
			System.out.println("��������");
		}else {
			System.out.println("��������");
		}
		mav.setViewName(gotoPage);
		return mav;
	}
}
