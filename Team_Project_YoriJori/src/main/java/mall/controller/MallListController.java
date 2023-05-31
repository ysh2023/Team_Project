package mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import mall.model.ProductBean;
import mall.model.ProductDao;

@Controller
public class MallListController {

	private final String command="/shop.mall";
	private final String getPage="allShop";
	
	@Autowired
	@Qualifier("myProductDao")
	ProductDao pdao;
	
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(	Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		List<ProductBean> lists = pdao.getAllProduct();
		
		
		mav.addObject("lists", lists);
		mav.setViewName(getPage);
		
		
		return mav; 
		
	}
	
}
