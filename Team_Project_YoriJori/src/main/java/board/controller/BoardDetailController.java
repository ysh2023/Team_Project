package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardContentBean;
import board.model.BoardDao;
import board.model.BoardIngredientBean;
import board.model.RecommendBean;
import member.model.MemberBean;
import refrigerator.model.RefBean;
import refrigerator.model.RefDao;

@Controller
public class BoardDetailController {
	private final String command = "boardDetail.board";
	private String page = "boardDetail";

	@Autowired
	BoardDao bdao;
	
	@Autowired
	RefDao refdao;

	@RequestMapping(value = command)
	public String doAction(Model model, @RequestParam(value = "bodNum") String bodNum, HttpSession session) {

		BoardBean boardBean = bdao.getBoardByBodNum(bodNum);
		List<BoardContentBean> boardContentList = bdao.getBoardContentByBodNum(bodNum);
		List<BoardIngredientBean> boardIngredientList = bdao.getBoardIngredientByBodNum(bodNum);
		MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
		model.addAttribute("loginInfo", memberBean);
		model.addAttribute("board", boardBean);
		model.addAttribute("boardContentList", boardContentList);
		model.addAttribute("tags", boardBean.getTags());
		model.addAttribute("boardIngredientList", boardIngredientList);
		model.addAttribute("commentsList", bdao.getCommentByBodNum(bodNum));
		if (memberBean == null) {
			model.addAttribute("recommend", 0);
		} else {
			Map<String, String> map = new HashMap<String, String>();
			map.put("bodNum", bodNum);
			map.put("id", memberBean.getId());
			RecommendBean recommendBean = bdao.getRecommendByBodNumAndId(map);
			if (recommendBean == null) {
				model.addAttribute("recommend", 0);
			} else {
				model.addAttribute("recommend", 1);
			}
			
			/* 냉장고 전체 리스트 */
			Map<String,String> listMap = new HashMap<String,String>();
			listMap.put("id", memberBean.getId());
			listMap.put("arrange", "r.inputdate");
			List<RefBean> refList = refdao.getUserRef(listMap);
			model.addAttribute("refList",refList);
		}
		return page;
	}
}
