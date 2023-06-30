package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
	public String doAction(BoardFormBean boardFormBean, Model model, HttpSession session, HttpServletRequest request) {

		String uploadPath = servletContext.getRealPath("/resources/images");
		String str = "c:\\tempUpload";
		File destination;
		File destination_local;
		File destination_local_in = null;
		MultipartFile multi = null;

		BoardBean prevBoardBean = bdao.getBoardByBodNum(String.valueOf(boardFormBean.getBod_num()));
		BoardBean boardBean = new BoardBean();

		// 게시글 테이블
		boardBean.setTitle(boardFormBean.getTitle());
		boardBean.setServings(
				boardFormBean.getServings().equals("") ? 0 : Integer.parseInt(boardFormBean.getServings()));
		boardBean.setTime(boardFormBean.getTime().equals("") ? 0 : Integer.parseInt(boardFormBean.getTime()));
		boardBean.setCategory(boardFormBean.getCategory());
		boardBean.setTags(boardFormBean.getTags());
		boardBean.setBodNum(boardFormBean.getBod_num());
		boardBean.setId(((MemberBean) session.getAttribute("loginInfo")).getId());

		String uuid = UUID.randomUUID().toString();
		String[] imgName = null;

		if (!boardFormBean.getBod_image().equals("")) {

			imgName = boardFormBean.getBod_image().split("\\.");
			boardBean.setBodImage(imgName[0] + uuid + "." + imgName[1]);
			boardBean.setBodOrigin(boardFormBean.getBod_image());

		} else {
			boardBean.setBodOrigin(boardFormBean.getPrev_bod_origin());
			boardBean.setBodImage(boardFormBean.getPrev_bod_image());
		}

		int boardResult = bdao.updateBoard(boardBean);

		// 게시글 대표 이미지 삭제
		if (boardResult > -1 && prevBoardBean.getBodImage() != null
				&& !boardBean.getBodImage().equals(prevBoardBean.getBodImage())) {
			if (!prevBoardBean.getBodImage().equals(boardBean.getBodImage())) {

				destination_local = new File(str + File.separator + prevBoardBean.getBodImage());
				System.out.println("대표이미지 삭제\n" + destination_local);
				// destination_local_in = new File(uploadPath + File.separator +
				// prevBoardBean.getBodImage());
				if (destination_local.exists()) {
					if (destination_local.delete()) {
					}
				}
			}
		}

		// 게시글 대표 이미지 삽입
		if (boardResult > -1 && boardFormBean.getBod_image() != null) {
//			System.out.println("대표 이미지 삽입\n");
//			System.out.println(prevBoardBean.getBodImage());
//			System.out.println(boardBean.getBodImage());
//			System.out.println(prevBoardBean.getBodImage().equals(boardBean.getBodImage()));

			if (!prevBoardBean.getBodImage().equals(boardBean.getBodImage())) {
				// System.out.println("달라서 삽입");
				destination = new File(
						uploadPath + File.separator + boardFormBean.getBod_image_upload().getOriginalFilename());
				destination_local = new File(str + File.separator + boardBean.getBodImage());
				destination_local_in = new File(uploadPath + File.separator + boardBean.getBodImage());
				multi = boardFormBean.getBod_image_upload();
				try {
					multi.transferTo(destination);
					int resultCopy = FileCopyUtils.copy(destination, destination_local);
					if (resultCopy > 0) {

						FileCopyUtils.copy(destination_local, destination_local_in);
						// System.out.println("복사 완료\n복사경로");
						// System.out.println(destination_local_in);
					}
				} catch (IllegalStateException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} else {
				// System.out.println("같아서 냅둠");
			}
		}

		if (boardResult > -1) {

			int boardIngredientResult = 0;
			int boardContentResult = 0;

			// 식재료 테이블 삭제 후 수정
			if (bdao.deleteBoardIngredient(boardFormBean.getBod_num()) > -1) {
				// System.out.println("삭제는 일단 성공");
				for (int i = 0; i < boardFormBean.getBig_name().length; i++) {
					BoardIngredientBean boardIngredientBean = new BoardIngredientBean();
					boardIngredientBean.setBodNum(boardFormBean.getBod_num());
					boardIngredientBean.setBigName(boardFormBean.getBig_name()[i]);
					boardIngredientBean.setBigAmount(
							boardFormBean.getBig_amount()[i] == null ? "" : boardFormBean.getBig_amount()[i]);
					boardIngredientBean.setIngNum(boardFormBean.getIng_num()[i]);
					boardIngredientResult = bdao.updateInsertBoardIngredient(boardIngredientBean);
				}
			} else {
				System.out.println("수정 - boardIngredient 삭제 실패");

			}

			List<String> prevBoardContentList = bdao
					.getBoardContentImageByBodNum(String.valueOf(boardFormBean.getBod_num()));
			List<String> insertBoardContentList = new ArrayList<String>();

			// 조리과정 테이블 삭제 후 수정
			if (bdao.deleteBoardContent(boardFormBean.getBod_num()) > -1) {

				for (int i = 0; i < boardFormBean.getImage().length; i++) {

					if (!boardFormBean.getImage()[i].equals("")) {
						uuid = UUID.randomUUID().toString();
						imgName = boardFormBean.getImage()[i].split("\\.");
					}

					BoardContentBean boardContentBean = new BoardContentBean();
					boardContentBean.setBodNum(boardFormBean.getBod_num());

					String updateContentImage = "";
					String originUpdateContentImage = "";

					// 조리과정 입력 받는부분
					if (boardFormBean.getPrev_image().length > i) {

						updateContentImage = boardFormBean.getImage()[i].equals("")
								? boardFormBean.getPrev_image()[i] == null ? "" : boardFormBean.getPrev_image()[i]
								: imgName[0] + uuid + "." + imgName[1];

						originUpdateContentImage = boardFormBean.getImage()[i].equals("")
								? boardFormBean.getOriginImage()[i] == null ? "" : boardFormBean.getOriginImage()[i]
								: boardFormBean.getImage()[i];
					} else {
						updateContentImage = boardFormBean.getImage()[i].equals("") ? boardFormBean.getImage()[i]
								: imgName[0] + uuid + "." + imgName[1];
						originUpdateContentImage = boardFormBean.getImage()[i];
					}

					boardContentBean.setImage(updateContentImage);
					boardContentBean.setOriginImage(originUpdateContentImage);

					if (boardFormBean.getBod_content().length == 0) {
						boardContentBean.setBodContent("");
					} else {
						boardContentBean.setBodContent(
								boardFormBean.getBod_content()[i] == null ? "" : boardFormBean.getBod_content()[i]);
					}

					boardContentResult = bdao.updateInsertBoardContent(boardContentBean);

					if (boardContentResult > 0) {
						if (boardContentBean.getImage() != null) {
							insertBoardContentList.add(boardContentBean.getImage());
							// System.out.println(boardContentBean.getImage());
						}

						if (boardFormBean.getUpload()[i].getOriginalFilename().equals("")
								|| prevBoardContentList.contains(boardContentBean.getImage())) {
							continue;
						}

						destination = new File(uploadPath + File.separator + originUpdateContentImage);
						destination_local = new File(str + File.separator + updateContentImage);
						destination_local_in = new File(uploadPath + File.separator + updateContentImage);
						multi = boardFormBean.getUpload()[i];

						try {
							multi.transferTo(destination);
							int resultCopy = FileCopyUtils.copy(destination, destination_local);
							if (resultCopy > 0) {
								FileCopyUtils.copy(destination_local, destination_local_in);
							}
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

				for (int i = 0; i < prevBoardContentList.size(); i++) {
					if (insertBoardContentList.contains(prevBoardContentList.get(i))) {
						prevBoardContentList.set(i, "");
					}
				}

				for (int i = 0; i < prevBoardContentList.size(); i++) {
					destination_local = new File(str + File.separator + prevBoardContentList.get(i));
					if (destination_local.exists()) {
						if (destination_local.delete()) {
							// System.out.println("조리과정 이미지 삭제 성공");
							// System.out.println(destination_local);
							// System.out.println(prevBoardContentList.get(i));
						}
					}
				}

			} else {
				System.out.println("수정 - boardContent 삭제 실패");

			}

		}
		return page;
	}
}
