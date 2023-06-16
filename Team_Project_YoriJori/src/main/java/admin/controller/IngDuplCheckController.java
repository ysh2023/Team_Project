package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.model.AdminDao;

@Controller
public class IngDuplCheckController {
	@Autowired
	AdminDao adao;
	
	@ResponseBody
	@RequestMapping("/checkInsertIng.am")
	public String doAction(String ingname) {
		
		int dupl = adao.checkIng(ingname);
		if(dupl==0) {
			return "YES";
		}else {
			return "NO";
		}
		
	}
	
}
