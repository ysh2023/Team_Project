package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import member.model.MemberDao;
import member.model.StopBean;

@Controller
public class AdminInsertStopController {
	private final String command = "/stopMember.am";
	private final String getPage = "redirect:/mbReportList.am";
	private final String gotoPage = "redirect:/mbStopList.am";

	@Autowired
	MemberDao mdao;
	
	@Autowired
	AdminDao adao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("check") String check) throws ParseException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;

		StopBean sb = new StopBean();
		sb.setId(request.getParameter("id"));
		int stopdate_temp = Integer.parseInt(request.getParameter("stopdate"));

		Date now = new Date();

		Calendar cal = Calendar.getInstance();
		cal.setTime(now);

		cal.add(Calendar.DATE, stopdate_temp); // 날짜만큼 더하기

		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
		

		int month = cal.get(Calendar.MONTH) + 1;
		sb.setStopdate(dtFormat.format(cal.getTime()));
		System.out.print(dtFormat.format(cal.getTime()));
		
		System.out.print("어디서 넘어왔는가"+check);

		if (check.equals("ys")) {

			
			if(mdao.searchStopById(sb.getId())) {
				try {
					out = response.getWriter();
					out.println("<script>alert('이미 정지회원입니다');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}else {
				mdao.insertStop(sb);
				try {
					out = response.getWriter();
					out.println("<script>alert('정지처리했습니다.');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				adao.deleteReport(request.getParameter("id")); //정지먹으면 삭제하기
			}
				return getPage;
			} 
		
		else { //정지리스트에서 수정버튼을 눌렀을경우 

			mdao.updateStop(sb);
			return gotoPage;
		}

	}
}
