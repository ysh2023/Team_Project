package board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
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
			@RequestParam(value = "pageNumber", required = false) String pageNumber, HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");

		int totalCount = bdao.getTotalCount(map);
		System.out.println("totalCount : " + totalCount);
		Paging pageInfo = new Paging(pageNumber, "12", totalCount, request.getContextPath() + command, whatColumn,
				keyword, null);

		model.addAttribute("boardList", bdao.getAllBoard(map, pageInfo));

		String arr[] = { "All", "밥", "국", "찌개", "반찬", "라면", "기타" };

//		model.addAttribute("categorys", bdao.getAllCategory());
		model.addAttribute("foodCategorys", arr);
		model.addAttribute("ingredientCategorys", bdao.getIngredientCategory());
		model.addAttribute("selectCategory", keyword == null ? "All" : keyword);
		model.addAttribute("topBoards", bdao.getTopBoard());
		model.addAttribute("pageInfo", pageInfo);
		return page;

	}
}
