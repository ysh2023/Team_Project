package board.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardContentBean;
import board.model.BoardDao;

@Controller
public class BoardDeleteController {
	private final String command = "boardDelete.board";
	private String page = "redirect:/main.board";

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam("bodNum") String bodNum, HttpSession session) {

		BoardBean boardBean = bdao.getBoardByBodNum(bodNum);
		List<BoardContentBean> boardContentList = bdao.getBoardContentByBodNum(bodNum);
		System.out.println(boardBean.getBodImage());
		String str = "c:\\tempUpload";
		if (boardBean.getBodImage() != null) {
			File deleteFile = new File(str + File.separator + boardBean.getBodImage());
			if (deleteFile.exists()) {
				if (deleteFile.delete()) {
					System.out.println("삭제성공");
				}
			}
		}

		for (BoardContentBean b : boardContentList) {
			File deleteFile = new File(str + File.separator + b.getImage());
			if (deleteFile.exists()) {
				if (deleteFile.delete()) {
					System.out.println("조리과정 삭제성공");
				}
			}
		}

		int result = bdao.deleteBoardByBodNum(bodNum);

		return page;
	}
}
