package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.model.AdminDao;

@Controller
public class IngRefCheckController {
	@Autowired
	AdminDao adao;
	
	@ResponseBody
	@RequestMapping("/refCheck.am")
	public String doAction(int ingnum) {
		
		int used = adao.checkRef(ingnum);
		if(used==0) {
			return "YES";
		}else {
			return "NO";
		}
		
	}

}
