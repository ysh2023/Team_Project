package admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;

@Controller
public class IngDeleteController {
	@Autowired
	AdminDao adao;
	
	@RequestMapping("/ingDelete.am")
	public String doAction(@RequestParam("ingnum") int ingnum, HttpServletRequest request) {
		System.out.println("ingnum: "+ingnum);
		
		int cnt = adao.deleteIng(ingnum);
		
		if(cnt!=-1) {
			request.setAttribute("msg", "선택하신 식재료가 삭제되었습니다.");
			request.setAttribute("url", "/ex/ingList.am");
		}
		
		return "am_alert";
	}

}
