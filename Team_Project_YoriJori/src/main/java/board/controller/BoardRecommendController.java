package board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.model.BoardDao;
import board.model.RecommendBean;
import member.model.MemberBean;

@Controller
public class BoardRecommendController {

	private final String command = "recommend.board";

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	@ResponseBody
	public String doAction(@RequestParam(value = "bodNum") String bodNum, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("bodNum", bodNum);
		map.put("id", ((MemberBean) session.getAttribute("loginInfo")).getId());
		RecommendBean recommendBean = bdao.getRecommendByBodNumAndId(map);

		if (recommendBean == null) {
			int result = bdao.insertRecommend(map);
			if (result > 0) {
				return "1";
			} else {
				return "-1";
			}
		} else {
			int result = bdao.deleteRecommend(recommendBean);
			if (result > 0) {
				return "0";
			} else {
				return "-1";
			}
		}
	}
}
