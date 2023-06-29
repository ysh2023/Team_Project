package board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import member.model.MemberBean;
import utility.Paging;

@Controller
public class BoardRefRecommendController {
	private final String command = "/refRecommend.board";
	private String page = "boardSearchRef";

	@Autowired
	BoardDao bdao;

	@RequestMapping(command)
	public String doAction(Model model, @RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber, HttpServletRequest request,
			HttpSession session, String ingredient, String[] arr, String[] refdday, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		Map<String, String> map = new HashMap<String, String>();
		String id = "";
		if (session.getAttribute("loginInfo") != null) {
			id = ((MemberBean) session.getAttribute("loginInfo")).getId();
		}
		if (ingredient == null) {
			ingredient = (String) session.getAttribute("ingredient");
		}

		if (ingredient != null) {

			if (refdday != null) {
				model.addAttribute("refdday", refdday);
			}
			if (refdday == null) {
				refdday = (String[]) session.getAttribute("refdday");
			}

			String[] ingreList = ingredient.split(",");
			if (session.getAttribute("arr") == null) {
				if (arr == null) {
					arr = ingreList;
				}
			} else {
				arr = (String[]) session.getAttribute("arr");
			}

//			if (ingredient.split(",") == null) {
//
//			} else {
//
//			}
			session.setAttribute("arr", arr);
			session.setAttribute("refdday", refdday);
			session.setAttribute("ingredient", ingredient);

			int ingredientCount = ingreList.length;
			// 식재료를 count만큼 가진 recipe를 얻기위한 count
			String count = String.valueOf(ingredientCount);
			String str = "";
			// 넘어온 식재료List를 sql에 맞게 변형
			for (int i = 0; i < ingreList.length; i++) {
				if (i == ingreList.length - 1) {
					str += ingreList[i];
				} else {
					str += ingreList[i] + "|";
				}
			}

			map.put("str", str);
			map.put("count", count);
			map.put("id", id);
			int totalCount = bdao.getRefRecommendTotalCount(map);
			Paging pageInfo = new Paging(pageNumber, "12", totalCount, request.getContextPath() + command, null, null,
					null);
			// pageInfo.setIngredient(ingredient);
			model.addAttribute("boardList", bdao.getRefRecommendBoard(map, pageInfo));
			model.addAttribute("ingreList", ingreList);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("arr", arr);
			return page;
		} else {
			try {
				response.getWriter().append("<script>alert('식재료를 하나이상 선택해주세요');history.back();</script>").flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}

	}
}
