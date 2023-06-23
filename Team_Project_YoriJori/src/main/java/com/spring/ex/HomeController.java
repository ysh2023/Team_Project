package com.spring.ex;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import basket.model.BasketDao;
import member.model.MemberBean;
import order.model.OrderDao;
import product.model.ProductBean;
import product.model.ProductDao;
import recipe.model.RecipeBean;
import recipe.model.RecipeDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	ProductDao pdao;
	
	@Autowired
	RecipeDao rdao;
	
	@Autowired
	BasketDao bdao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		//장바구니
		if((MemberBean)session.getAttribute("loginInfo")!=null) {
			String id=((MemberBean)session.getAttribute("loginInfo")).getId();
			int cnt = bdao.BasketCount(id);
			if(cnt>0) {
				model.addAttribute("cnt", cnt);
			}else {
				model.addAttribute("cnt", 0);
			}
		}else {
			model.addAttribute("cnt", 0);
		}
		
		//레시피
		List<RecipeBean> recipeList = rdao.getRecipeForMain();
		
		model.addAttribute("recipeList", recipeList);
		
		//상품
		List<ProductBean> plists= pdao.getAllProducts();
		
		model.addAttribute("plists",plists);

		return "/home";
	}



}
