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
		boardBean.setBodNum(boardFormBean.getBod_num());
		String updateFileName = boardFormBean.getBod_image_upload().getOriginalFilename().equals("")
				? boardFormBean.getPrev_bod_image()
				: boardFormBean.getBod_image_upload().getOriginalFilename();
		boardBean.setBodImage(updateFileName);

		int boardResult = bdao.updateBoard(boardBean);

		destination = new File(uploadPath + File.separator + updateFileName);
		destination_local = new File(str + File.separator + updateFileName);
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
			int boardIngredientResult = 0;
			int boardContentResult = 0;

			// 식재료 테이블 삭제 후 수정
			if (bdao.deleteBoardIngredient(boardFormBean.getBod_num()) > 0) {
				for (int i = 0; i < boardFormBean.getBig_name().length; i++) {
					BoardIngredientBean boardIngredientBean = new BoardIngredientBean();
					boardIngredientBean.setBodNum(boardFormBean.getBod_num());
					boardIngredientBean.setBigName(boardFormBean.getBig_name()[i]);
					boardIngredientBean.setBigAmount(
							boardFormBean.getBig_amount()[i] == null ? "" : boardFormBean.getBig_amount()[i]);
					boardIngredientBean.setIngNum(boardFormBean.getIng_num()[i]);
					boardIngredientResult = bdao.updateInsertBoardIngredient(boardIngredientBean);
					if (boardIngredientResult < 0) {
						System.out.println("수정 - boardIngredient 삽입 실패" + i);
					}

				}
			} else {
				System.out.println("수정 - boardIngredient 삭제 실패");

			}

			// 조리과정 테이블 삭제 후 수정
			if (bdao.deleteBoardContent(boardFormBean.getBod_num()) > 0) {

				for (int i = 0; i < boardFormBean.getBod_content().length; i++) {
					BoardContentBean boardContentBean = new BoardContentBean();
					boardContentBean.setBodNum(boardFormBean.getBod_num());

					String updateContentImage = "";
					if (boardFormBean.getPrev_image().length > i) {

						updateContentImage = boardFormBean.getImage()[i].equals("")
								? boardFormBean.getPrev_image()[i] == null ? "" : boardFormBean.getPrev_image()[i]
								: boardFormBean.getImage()[i];
					} else {
						updateContentImage = boardFormBean.getImage()[i];
					}

					boardContentBean.setImage(updateContentImage);
					boardContentBean.setBodContent(
							boardFormBean.getBod_content()[i] == null ? "" : boardFormBean.getBod_content()[i]);

					boardContentResult = bdao.updateInsertBoardContent(boardContentBean);

					if (boardContentResult > 0) {
						if (boardFormBean.getUpload()[i].getOriginalFilename().equals("")) {
							continue;
						}

						destination = new File(uploadPath + File.separator + updateContentImage);
						destination_local = new File(str + File.separator + updateContentImage);
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

					} else {
						System.out.println("수정 - boardContent 삽입 실패" + i);
					}
				}
			} else {
				System.out.println("수정 - boardContent 삭제 실패");

			}

		}
		return page;
	}
}
