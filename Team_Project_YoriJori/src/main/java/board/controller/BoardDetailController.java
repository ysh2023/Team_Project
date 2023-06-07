package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardContentBean;
import board.model.BoardDao;
import board.model.BoardIngredientBean;

@Controller
public class BoardDetailController {
	private final String command = "boardDetail.board";
	private String page = "boardDetail";

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	public String doAction(Model model, @RequestParam(value = "bodNum") String bodNum) {
		BoardBean boardBean = bdao.getBoardByBodNum(bodNum);
		List<BoardContentBean> boardContentList = bdao.getBoardContentByBodNum(bodNum);
		List<BoardIngredientBean> boardIngredientList = bdao.getBoardIngredientByBodNum(bodNum);
		// bdao.getBoardIngredientByBodNum(bodNum);

		model.addAttribute("board", boardBean);
		model.addAttribute("boardContentList", boardContentList);
		model.addAttribute("tags", boardBean.getTags());
		model.addAttribute("boardIngredientList", boardIngredientList);
		// model.addAttribute("comments", bdao.getCommentByBodNum(bodNum));
		return page;
	}
}
