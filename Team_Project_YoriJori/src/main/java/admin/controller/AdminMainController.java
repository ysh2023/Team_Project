package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.AdminDao;
import board.model.BoardBean;
import member.model.MemberBean;
import order.model.GroupBean;
import order.model.OrderBean;
import orderdetail.model.DetailGroupBean;

@Controller
public class AdminMainController {
	private final String command = "/main.am";
	private final String getPage = "am_main";
	
	@Autowired
	AdminDao adao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpSession session,HttpServletResponse response, Model model) {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
	
	
		
		if((MemberBean)session.getAttribute("loginInfo")!=null) {
			String id=((MemberBean)session.getAttribute("loginInfo")).getId();
			if(id.equals("admin")) {
				System.out.print(id);
				
				/* 가입자 수 통계 */
				int totalMember = adao.getMemberCount();
				model.addAttribute("totalMember", totalMember);
				
				Map<String, String> mapJan = new HashMap<String, String>();
				mapJan.put("start", "2023-01-01");
				mapJan.put("end", "2023-01-31");
				int jan = adao.getRegisterCount(mapJan);
				model.addAttribute("jan",jan);
				
				Map<String, String> mapFeb = new HashMap<String, String>();
				mapFeb.put("start", "2023-02-01");
				mapFeb.put("end", "2023-02-28");
				int feb = adao.getRegisterCount(mapFeb);
				model.addAttribute("feb",feb);
				
				Map<String, String> mapMar = new HashMap<String, String>();
				mapMar.put("start", "2023-03-01");
				mapMar.put("end", "2023-03-31");
				int mar = adao.getRegisterCount(mapMar);
				model.addAttribute("mar",mar);
				
				Map<String, String> mapApr = new HashMap<String, String>();
				mapApr.put("start", "2023-04-01");
				mapApr.put("end", "2023-04-30");
				int apr = adao.getRegisterCount(mapApr);
				model.addAttribute("apr",apr);
				
				Map<String, String> mapMay = new HashMap<String, String>();
				mapMay.put("start", "2023-05-01");
				mapMay.put("end", "2023-05-31");
				int may = adao.getRegisterCount(mapMay);
				model.addAttribute("may",may);
				
				Map<String, String> mapJune = new HashMap<String, String>();
				mapJune.put("start", "2023-06-01");
				mapJune.put("end", "2023-06-30");
				int june = adao.getRegisterCount(mapJune);
				model.addAttribute("june",june);
				
				/* 1년 주문, 매출 */
				Map<String, String> mapOrder = new HashMap<String, String>();
				mapOrder.put("start", "2023-01-01");
				mapOrder.put("end", "2023-12-31");
				int ordernum = adao.getOrderCount(mapOrder);
				model.addAttribute("ordernum",ordernum);
				
				Map<String, String> mapSales = new HashMap<String, String>();
				mapSales.put("start", "2023-01-01");
				mapSales.put("end", "2023-12-31");
				int sales = adao.getOrderSales(mapSales);
				model.addAttribute("sales",sales);
				
				/* 최근 주문 */
				List<OrderBean> orderlist = adao.getAllOrder(); 
				model.addAttribute("orderlist", orderlist);
				
				/* 판매량 많은 상품 상위 5개 */
				List<GroupBean> topseller = adao.getTopSeller();
				model.addAttribute("topseller", topseller);
				
				/* 판매량 많은 상품 상위 5개(낱개) */
				List<DetailGroupBean> detailtopseller = adao.getDetailTopSeller();
				model.addAttribute("detailtopseller", detailtopseller);
				
				
				/* 사용자 게시판 상위 5개 */
				List<BoardBean> boardlist = adao.getRecentBoard();
				model.addAttribute("boardlist", boardlist);
				
				return getPage;
			}else {
				try {
					out = response.getWriter();
					out.println("<script>alert('관리자화면은 관리자만 들어올 수 있습니다.');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				return "/ex";
			}
		}
		else {
			try {
				out = response.getWriter();
				out.println("<script>alert('로그인을 진행해주세요.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:login.mb";
		}
		
		
	}

}
