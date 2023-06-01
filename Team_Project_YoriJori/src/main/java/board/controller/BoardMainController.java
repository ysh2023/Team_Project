package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardMainController {

	@RequestMapping("main.board")
	public String doAction() {
		return "boardMain";
	}
}
