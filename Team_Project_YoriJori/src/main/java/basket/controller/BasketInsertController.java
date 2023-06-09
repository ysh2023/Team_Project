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
public class BasketInsertController {
	private final String command="/insert.bsk";
	private final String gotoPage="redirect:list.bsk";
	private final String gotologinPage="redirect:/login.mb";
	
	@Autowired
	BasketDao bdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="pdnum") int pdnum,
			@RequestParam(value="qty") int qty,
			Model model, HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		System.out.println("loginInfo:"+loginInfo);
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("loginInfo") == null) {	//�α��� ��������
			session.setAttribute("destination", "redirect:/shop.prd");	//destination �Ӽ� ����
			mav.setViewName(gotologinPage);
			return mav;	//�α��� ��������
		}else {
			
			BasketBean bb = new BasketBean();
			bb.setBskid(String.valueOf(loginInfo.getId()));
			bb.setBskpdnum(pdnum);
			bb.setBskqty(qty);
			BasketBean bb2 = bdao.getBasketnum(pdnum);
			if(bb2 == null) { // ��ٱ��ϰ� ���������
				int cnt = bdao.insertBasket(bb);
				if(cnt > 1) {
					System.out.println("��ٱ��� insert ����");
				}else {
					System.out.println("��ٱ��� insert ����");
				}
				mav.setViewName(gotoPage);
			}else if(bb2.getBskpdnum() == pdnum) {// ��ٱ��Ͽ� �ִ� ��ǰ�� ��ٱ��Ͽ� �߰� ������
				try {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('�̹� ��ٱ��Ͽ� ��ϵ� ��ǰ�Դϴ�.'); location.href='shop.prd';</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}
		return mav;
		
	}
}
