package board.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
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
	ServletContext servletContext;

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam("bodNum") String bodNum, HttpSession session) {

		String str = "c:\\tempUpload";
		String serverPath = servletContext.getRealPath("/resources/images");

		BoardBean boardBean = bdao.getBoardByBodNum(bodNum);
		List<BoardContentBean> boardContentList = bdao.getBoardContentByBodNum(bodNum);

		int result = bdao.deleteBoardByBodNum(bodNum);

		if (result > 0) {
			if (boardBean.getBodImage() != null) {
				File deleteFile = new File(str + File.separator + boardBean.getBodImage());
				File serverFile = new File(serverPath + File.separator + boardBean.getBodImage());
				if (deleteFile.exists()) {
					if (deleteFile.delete()) {
						// System.out.println("삭제성공");
					}
				}
				if (serverFile.exists()) {
					if (serverFile.delete()) {
						// System.out.println("서버 삭제성공");
					}
				}
			}

			if (boardContentList.size() > 0) {
				for (int i = 0; i < boardContentList.size(); i++) {
					System.out.println(boardContentList.get(i).getImage());
					if (boardContentList.get(i).getImage() != null) {
						File deleteFile = new File(str + File.separator + boardContentList.get(i).getImage());
						File serverFile = new File(serverPath + File.separator + boardBean.getBodImage());

						if (deleteFile.exists()) {

							if (deleteFile.delete()) {
								// System.out.println("조리과정 삭제성공");
							}
						}
						if (serverFile.exists()) {
							if (serverFile.delete()) {
								// System.out.println("서버 조리과정 삭제성공");
							}
						}
					}
				}
			}

		}
		return page;
	}
}
