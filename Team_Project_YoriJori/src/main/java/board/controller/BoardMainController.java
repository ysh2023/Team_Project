package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;
import utility.Paging;

@Controller
public class BoardMainController {
	private final String command = "/main.board";
	private String page = "boardMain";

	@Autowired
	BoardDao bdao;

	@RequestMapping(command)
	public String doAction(Model model, @RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber, HttpServletRequest request,
			HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		if (keyword == null) {
			keyword = "All";
		}
		map.put("keyword", "%" + keyword + "%");
		map.put("category", keyword);
		String id = "";
		if (session.getAttribute("loginInfo") != null) {
			id = ((MemberBean) session.getAttribute("loginInfo")).getId();
		}
		map.put("id", id);

		int totalCount = bdao.getTotalCount(map);
		Paging pageInfo = new Paging(pageNumber, "12", totalCount, request.getContextPath() + command, whatColumn,
				keyword, null);
		List<BoardBean> list = bdao.getAllBoard(map, pageInfo);

		model.addAttribute("boardList", bdao.getAllBoard(map, pageInfo));

		String arr[] = { "All", "밥", "국", "찌개", "반찬", "라면", "기타" };

//		model.addAttribute("categorys", bdao.getAllCategory());
		List<String> ingredientCategory = bdao.getIngredientCategory();
		ingredientCategory.remove(0);
		ingredientCategory.add("그외 식재료");
		model.addAttribute("foodCategorys", arr);
		model.addAttribute("ingredientCategorys", ingredientCategory);
		model.addAttribute("selectCategory", keyword == null ? "All" : keyword.equals("other") ? "그외 식재료" : keyword);
		model.addAttribute("topBoards", bdao.getTopBoard());
		model.addAttribute("pageInfo", pageInfo);
		return page;

	}
}
