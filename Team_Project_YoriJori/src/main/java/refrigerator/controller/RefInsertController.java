package refrigerator.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ingredient.model.IngBean;
import ingredient.model.IngDao;


@Controller
public class RefInsertController {
	private final String command = "/insert.ref";
	private String getPage = "insertRefrigerator";
	
	@Autowired
	IngDao ingdao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(Model model, HttpSession session,
						@RequestParam(value="whatColumn",required=false) String whatColumn,
						@RequestParam(value="keyword",required=false) String keyword) {
		
		List<IngBean> ingList1 = ingdao.getIngbyCtg("���/��/�߰���");
		List<IngBean> ingList2 = ingdao.getIngbyCtg("���/����ǰ");
		List<IngBean> ingList3 = ingdao.getIngbyCtg("ä��");
		List<IngBean> ingList4 = ingdao.getIngbyCtg("����");
		List<IngBean> ingList5 = ingdao.getIngbyCtg("����/�ػ깰");
		List<IngBean> ingList6 = ingdao.getIngbyCtg("��/��/��");
		List<IngBean> ingList7 = ingdao.getIngbyCtg("�ҽ�/����");
		
		model.addAttribute("ingList1", ingList1);
		model.addAttribute("ingList2", ingList2);
		model.addAttribute("ingList3", ingList3);
		model.addAttribute("ingList4", ingList4);
		model.addAttribute("ingList5", ingList5);
		model.addAttribute("ingList6", ingList6);
		model.addAttribute("ingList7", ingList7);
		
		return getPage; 
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView insert() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
}
