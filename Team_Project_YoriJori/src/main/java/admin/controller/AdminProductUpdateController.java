package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class AdminProductUpdateController {
	private final String command = "/prdUpdate.am";
	private String getPage = "am_prdUpdateForm";
	
	
	ProductDao pdao= new ProductDao();
	
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("pdnum") int pdnum) {
		ModelAndView mav = new ModelAndView();
		ProductBean product = pdao.getByNum(pdnum);
		
		
		mav.addObject("product", product);
		mav.setViewName(getPage);
		
		return mav; 
		
	}
}
