package recipe.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import recipe.model.RecipeBean;
import recipe.model.RecipeDao;
import recipe.model.RecipeRecommendBean;
import utility.Paging2;

@Controller
public class RecipeRecommendController {
	private final String command ="/Recommend.re";
	private final String getPage="RecipeRecommendList";
	
	@Autowired
	RecipeDao rdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="keyword",required=false) String keyword,
									@RequestParam(value="whatColumn",required=false) String whatColumn,
									@RequestParam(value="pageNumber", required=false) String pageNumber, 
									HttpServletRequest request,
									HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//List<String>을 넘기기 위해 Bean을 만들어서 입력받은 값을 List로 가져옴
		String[] ingreList = request.getParameterValues("ingredient");
		String[] refdday = request.getParameterValues("refdday");
		List<Integer> day = new ArrayList<Integer>();
		for(int i=0; i<refdday.length; i++) {
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date parsedday=null;
			try {
				parsedday = sdf.parse(refdday[i]);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			double result = (now.getTime() - parsedday.getTime());
			double dday = result / (24*60*60*1000)-1;
			if(dday>0) {
				dday = dday +(1-(dday%1))%1;
			}
			day.add((int)dday);
		}
		int ingredientCount = ingreList.length;;
		//식재료를 count만큼 가진 recipe를 얻기위한 count
		String str = "";
		//넘어온 식재료List를 sql에 맞게 변형
		for(int i=0;i<ingredientCount;i++) {
			if(i==ingredientCount-1) {
				str += ingreList[i];
			}else {
				str += ingreList[i]+"|";
			}
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		String id = "";
		if (session.getAttribute("loginInfo") != null) {
			id = ((MemberBean) session.getAttribute("loginInfo")).getId();
		}
		map.put("id", id);
		int recipeTotalCount = rdao.getRecipeTotalCountByIngre(map);
		String url = request.getContextPath()+command;
		Paging2 pageInfo = new Paging2(pageNumber, "12",recipeTotalCount, url, whatColumn, keyword, null);
		List<RecipeBean> recipeList = rdao.getRecipeListByIngredient(map,pageInfo);
		
		mav.addObject("day", day);
		mav.addObject("ingreList", ingreList);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("recipeList", recipeList);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doAction(@RequestParam(value="pageNumber",required=false) String pageNumber,@RequestParam(value="whatColumn") String whatColumn,HttpServletRequest request,HttpSession session) {
		System.out.println("post요청");
		String[] ingreList = request.getParameterValues("ingreList");
		String[] ingredient = request.getParameterValues("keyword");
		String[] day = request.getParameterValues("day");
		
		ModelAndView mav = new ModelAndView();
		int ingredientCount = ingredient.length;
		String str = "";
		//넘어온 식재료List를 sql에 맞게 변형
		for(int i=0;i<ingredientCount;i++) {
			if(i==ingredientCount-1) {
				str += ingredient[i];
			}else {
				str += ingredient[i]+"|";
			}
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		String id = "";
		if (session.getAttribute("loginInfo") != null) {
			id = ((MemberBean) session.getAttribute("loginInfo")).getId();
		}
		map.put("id", id);
		int recipeTotalCount = rdao.getRecipeTotalCountByIngre(map);
		String url = request.getContextPath()+"/Recommend.re";
		Paging2 pageInfo = new Paging2(pageNumber, "12",recipeTotalCount, url, null, null, null);
		List<RecipeBean> recipeList = rdao.getRecipeListByIngredient(map,pageInfo);
		mav.addObject("ingredient", ingredient);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("ingreList", ingreList);
		mav.addObject("recipeList", recipeList);
		mav.addObject("day", day);
		mav.setViewName(getPage);
		return mav;
	}
}
