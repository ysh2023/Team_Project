package basket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
public class BasketInsertController {
	private final String command="/insert.bsk";
	private final String gotoPage="redirect:list.bsk";
	private final String gotologinPage="redirect:/login.mb";
	
	@Autowired
	BasketDao bdao;
	
	@Autowired 
	ProductDao pdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="pdnum") int pdnum,
			@RequestParam(value="qty") int qty,
			Model model, HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		ProductBean pb = pdao.getByNum(pdnum);
		// 장바구니 insert시 재고수량 체크
		if(pb.getPdstock() < qty) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('구매수량이 재고수량보다 많습니다.'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		System.out.println("loginInfo:"+loginInfo);
		if(session.getAttribute("loginInfo") == null) {	//로그인 안했으면
			session.setAttribute("destination", "redirect:/shop.prd?whatColumn=no&searchName=");	//destination 속성 설정
			mav.setViewName(gotologinPage);
			return mav;	//로그인 페이지로
		}else {
			
				BasketBean bb = new BasketBean();
				bb.setBskid(String.valueOf(loginInfo.getId()));
				bb.setBskpdnum(pdnum);
				bb.setBskqty(qty);
				List<BasketBean> lists = new ArrayList<BasketBean>();
				lists = bdao.getBasketNullList(pdnum,loginInfo.getId());
				if(lists.size() == 0) {
					int cnt = -1;
					cnt = bdao.insertBasket(bb);
					if(cnt != -1) {
						System.out.println("장바구니 insert 성공");
						String id=((MemberBean)session.getAttribute("loginInfo")).getId();
						int bskcnt = bdao.BasketCount(id);
						if(bskcnt>0) {
							model.addAttribute("bskcnt", bskcnt);
						}else {
							model.addAttribute("bskcnt", 0);
						}
						session.setAttribute("bskcnt",bskcnt);
						mav.addObject("bskcnt", bskcnt);
					}else {
						System.out.println("장바구니 insert 실패");
					}
					mav.setViewName(gotoPage);
				}else{
					try {
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>alert('이미 장바구니에 등록된 상품입니다.'); history.go(-1);</script>");
						out.flush();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}	
		return mav;
		
	}
}
