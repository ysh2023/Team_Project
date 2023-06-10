package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.model.BoardBean;
import board.model.BoardContentBean;
import board.model.BoardDao;
import board.model.BoardFormBean;
import board.model.BoardIngredientBean;
import member.model.MemberBean;

@Controller
public class BoardUpdateController {
	private final String command = "boardUpdate.board";
	private String formPage = "boardUpdateForm";
	private String page = "redirect:/main.board";

	@Autowired
	ServletContext servletContext;

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("bodNum") String bodNum, Model model) {
		model.addAttribute("board", bdao.getBoardByBodNum(bodNum));
		model.addAttribute("boardContentList", bdao.getBoardContentByBodNum(bodNum));
		model.addAttribute("boardIngredientList", bdao.getBoardIngredientByBodNum(bodNum));

		String[] categoryss = { "밥", "국", "찌개", "반찬", "라면", "기타" };
		model.addAttribute("categorys", categoryss);
		model.addAttribute("ingredients", bdao.getAllIngredient());

		return formPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction(BoardFormBean boardFormBean, Model model, HttpSession session) {

		String uploadPath = servletContext.getRealPath("/resources/images");
		String str = "c:\\tempUpload";
		File destination;
		File destination_local;

		BoardBean boardBean = new BoardBean();

		// 게시글 테이블
		boardBean.setTitle(boardFormBean.getTitle());
		boardBean.setServings(
				boardFormBean.getServings().equals("") ? 0 : Integer.parseInt(boardFormBean.getServings()));
		boardBean.setTime(boardFormBean.getTime().equals("") ? 0 : Integer.parseInt(boardFormBean.getTime()));
		boardBean.setCategory(boardFormBean.getCategory());
		boardBean.setTags(boardFormBean.getTags());
		boardBean.setId(((MemberBean) session.getAttribute("loginInfo")).getId());
		boardBean.setBodImage(boardFormBean.getBod_image());
		boardBean.setBodNum(boardFormBean.getBod_num());
		int boardResult = bdao.updateBoard(boardBean);

		destination = new File(uploadPath + File.separator + boardFormBean.getBod_image_upload().getOriginalFilename());
		destination_local = new File(str + File.separator + boardFormBean.getBod_image_upload().getOriginalFilename());
		MultipartFile multi = boardFormBean.getBod_image_upload();

		if (boardResult > 0) {
			try {
				multi.transferTo(destination);
				FileCopyUtils.copy(destination, destination_local);
			} catch (IllegalStateException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			int boardIngredientResult = -1;
			int boardContentResult = -1;

			for (int i = 0; i < boardFormBean.getBig_name().length; i++) {
				BoardIngredientBean boardIngredientBean = new BoardIngredientBean();
				boardIngredientBean.setBodNum(boardFormBean.getBod_num());
				boardIngredientBean.setBigName(boardFormBean.getBig_name()[i]);
				boardIngredientBean
						.setBigAmount(boardFormBean.getBig_amount()[i] == null ? "" : boardFormBean.getBig_amount()[i]);
				boardIngredientBean.setIngNum(boardFormBean.getIng_num()[i]);
				boardIngredientResult += bdao.updateInsertBoardIngredient(boardIngredientBean);

			}

			for (int i = 0; i < boardFormBean.getBod_content().length; i++) {
				BoardContentBean boardContentBean = new BoardContentBean();
				boardContentBean.setBodNum(boardFormBean.getBod_num());
				boardContentBean.setImage(boardFormBean.getImage()[i] == null ? "" : boardFormBean.getImage()[i]);
				boardContentBean.setBodContent(
						boardFormBean.getBod_content()[i] == null ? "" : boardFormBean.getBod_content()[i]);
				boardContentResult += bdao.updateInsertBoardContent(boardContentBean);
			}

			if (boardIngredientResult < 0) {
				System.out.println("수정 - boardIngredient 삽입 실패 : ");
			}
			if (boardContentResult < 0) {
				System.out.println("수정 - boardContent 삽입 실패 : ");
			}

			for (int i = 0; i < boardFormBean.getUpload().length; i++) {
				destination = new File(
						uploadPath + File.separator + boardFormBean.getUpload()[i].getOriginalFilename());
				destination_local = new File(str + File.separator + boardFormBean.getUpload()[i].getOriginalFilename());
				multi = boardFormBean.getUpload()[i];

				try {
					multi.transferTo(destination);
					int a = FileCopyUtils.copy(destination, destination_local);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();

				}
			}

		}
		return page;
	}
}
