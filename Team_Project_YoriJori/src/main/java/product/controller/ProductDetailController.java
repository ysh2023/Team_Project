package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductDetailController {
	private final String command="/prdDetail.prd";
	private final String getPage="prdDetail";
	
	@Autowired
	@Qualifier("myProductDao")
	ProductDao pdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("pdnum") int pdnum,Model model) {
		
		ProductBean product = pdao.getByNum(pdnum);
		model.addAttribute("product",product);

		return getPage;
	}
	
}

