package product.controller;

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

import product.model.ProductBean;
import product.model.ProductDao;
import utility.Paging;

@Controller
public class ProductListController {

	private final String command="/shop.prd";
	private final String getPage="allShop";
	
	@Autowired
	@Qualifier("myProductDao")
	ProductDao pdao;
	
	
	
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			@RequestParam(value="searchName",required = false) String searchName,
			Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		
		Map<String,String> map= new HashMap<String,String>();
		
		map.put("whatColumn", whatColumn);
		map.put("keyword", keyword);
		map.put("searchName", "%"+searchName+"%");
		String url= request.getContextPath()+command;
		
		int totalCount=pdao.getTotalCount(map);
		
		Paging pageInfo= new Paging(pageNumber,"8",totalCount,url,whatColumn,keyword,null);
		
		List<ProductBean> lists = pdao.getAllProduct(pageInfo,map);
		
		
		mav.addObject("lists", lists);
		mav.addObject("keyword", keyword);
		mav.addObject("whatColumn", whatColumn);
		
		mav.addObject("searchName", searchName);
		mav.setViewName(getPage);
		
		
		mav.addObject("pageInfo",pageInfo);
		return mav; 
		
	}
	
}
