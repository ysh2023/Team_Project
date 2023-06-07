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
	public String doAction(Model model, @RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "categoryType", required = false) String categoryType) {
		Map<String, String> map = new HashMap<String, String>();
		if (category == null || category.equals("All")) {
			category = "All";
			categoryType = "0";
			map.put("category", category);
			map.put("categoryType", categoryType);
		} else {
			map.put("category", "%" + category + "%");
			map.put("categoryType", categoryType);
		}
		System.out.println(map.get("categoryType"));

		model.addAttribute("boardList", bdao.getAllBoard(map));

		String arr[] = { "All", "¹ä", "±¹", "Âî°³", "¹ÝÂù", "¶ó¸é", "±âÅ¸" };

//		model.addAttribute("categorys", bdao.getAllCategory());
		model.addAttribute("foodCategorys", arr);
		model.addAttribute("ingredientCategorys", bdao.getIngredientCategory());
		model.addAttribute("selectCategory", category);
		model.addAttribute("topBoards", bdao.getTopBoard());
		return "boardMain";

	}
}
