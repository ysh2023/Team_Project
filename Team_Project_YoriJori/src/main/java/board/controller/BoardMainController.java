package board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;

@Controller
public class BoardMainController {

	@Autowired
	BoardDao bdao;

	@RequestMapping("main.board")
	public String doAction(Model model, @RequestParam(value = "category", required = false) String category) {
		Map<String, String> map = new HashMap<String, String>();
		if (category == null || category.equals("All")) {
			category = "All";
			map.put("category", category);
		} else {
			map.put("category", "%" + category + "%");
		}
		System.out.println(category + "카테고리 메인");
		model.addAttribute("boardList", bdao.getAllBoard(map));
		String arr[] = { "All", "밥", "국", "찌개", "반찬", "라면", "기타" };
//		model.addAttribute("categorys", bdao.getAllCategory());
		model.addAttribute("categorys", arr);
		model.addAttribute("selectCategory", category);
		model.addAttribute("topBoards", bdao.getTopBoard());
		return "boardMain";

	}
}
