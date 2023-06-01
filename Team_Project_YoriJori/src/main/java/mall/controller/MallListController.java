package mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView doAction(@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="whatColumn",required = false) String whatColumn, 
			Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> map= new HashMap<String,String>();

		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		List<ProductBean> lists = pdao.getAllProduct(map);
		
		
		mav.addObject("lists", lists);
		mav.setViewName(getPage);
		
		
		return mav; 
		
	}
	
}
