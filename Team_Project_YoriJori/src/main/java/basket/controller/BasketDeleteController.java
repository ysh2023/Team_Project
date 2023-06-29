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
public class BasketDeleteController {
	private final String command="/delete.bsk";
	private final String gotoPage="redirect:list.bsk";
	
	@Autowired
	BasketDao bdao;
	 
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="bsknum") int bsknum,
			Model model, HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		int cnt = bdao.deleteBasket(bsknum);
		if(cnt >= 1) {
			System.out.println("장바구니 삭제 성공");
			int bskcnt = ((Integer) session.getAttribute("bskcnt"));
			if((MemberBean)session.getAttribute("loginInfo")!=null) {
				String id=((MemberBean)session.getAttribute("loginInfo")).getId();
				bskcnt = bdao.BasketCount(id);
				if(bskcnt>0) {
					model.addAttribute("bskcnt", bskcnt);
				}else {
					model.addAttribute("bskcnt", 0);
				}
				session.setAttribute("bskcnt",bskcnt);
			}else {
				model.addAttribute("bskcnt", 0);
			}
			mav.addObject("bskcnt", bskcnt);
		}else {
			System.out.println("장바구니 삭제 실패");
		}
		mav.setViewName(gotoPage);
		return mav;
	}
}
