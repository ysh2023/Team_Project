package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.model.AdminDao;
import ingredient.model.IngBean;

@Controller
public class IngUpdateCheckController {
	@Autowired
	AdminDao adao;
	
	@ResponseBody
	@RequestMapping("/checkUpdateIng.am")
	public String doAction(int ingnum, String ingname) {
		System.out.println("ingnum: "+ingnum);
		
		IngBean ingbean = adao.getIngDetail(ingnum);
		if(ingbean.getIngname().equals(ingname)) {
			return "KEEP";
		}else {
			int dupl = adao.checkIng(ingname);
			if(dupl==0) {
				return "YES";
			}else {
				return "NO";
			}
		}
		
	}
	
}
