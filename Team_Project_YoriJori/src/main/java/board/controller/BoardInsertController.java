package board.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import board.model.BoardBean;
import board.model.BoardContentBean;
import board.model.BoardDao;
import board.model.BoardFormBean;
import board.model.BoardIngredientBean;
import member.model.MemberBean;

@Controller
public class BoardInsertController {
	private final String command = "/write.board";
	private String formPage = "boardInsertForm";
	private String page = "redirect:/main.board";

	@Autowired
	ServletContext servletContext;

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model, HttpSession session, HttpServletResponse response) throws IOException {
		if (session.getAttribute("loginInfo") == null) {
			response.setContentType("text/html; charset=utf-8");
			session.setAttribute("destination", "redirect:/write.board");
			session.setAttribute("destination", "redirect:/write.board");
			response.getWriter().append("<script>alert('로그인 후 이용 가능합니다'); location.href='login.mb'</script>").flush();
			return null;
		} else {
			String[] categoryss = { "밥", "국", "찌개", "반찬", "라면", "기타" };
			model.addAttribute("categorys", categoryss);
			model.addAttribute("ingredients", bdao.getAllIngredient());
			return formPage;
		}

	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction(BoardFormBean boardFormBean, Model model, HttpSession session)
			throws UnsupportedEncodingException {

		String uploadPath = servletContext.getRealPath("/resources/images");
		String str = "c:\\tempUpload";
		File destination = null;
		File destination_local = null;
		File destination_local_in = null;
		MultipartFile multi = null;
		BoardBean boardBean = new BoardBean();

		// 사용자 레시피 저장
		boardBean.setTitle(boardFormBean.getTitle());
		boardBean.setServings(
				boardFormBean.getServings().equals("") ? 0 : Integer.parseInt(boardFormBean.getServings()));
		boardBean.setTime(boardFormBean.getTime().equals("") ? 0 : Integer.parseInt(boardFormBean.getTime()));
		boardBean.setCategory(boardFormBean.getCategory());
		boardBean.setTags(boardFormBean.getTags());
		boardBean.setId(((MemberBean) session.getAttribute("loginInfo")).getId());

		String uuid = UUID.randomUUID().toString();
		String[] imgName = null;
		if (!boardFormBean.getBod_image().equals("")) {
			imgName = boardFormBean.getBod_image().split("\\.");
			boardBean.setBodImage(imgName[0] + uuid + "." + imgName[1]);
			boardBean.setBodOrigin(boardFormBean.getBod_image());

		} else {
			boardBean.setBodOrigin(boardFormBean.getBod_image());
			boardBean.setBodImage(boardFormBean.getBod_image());
		}

		int boardResult = bdao.insertBoard(boardBean);

		// 게시글 대표 이미지 처리
		if (boardResult > 0 && !boardFormBean.getBod_image().equals("")) {
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
				}
			} catch (IllegalStateException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

		if (boardResult > 0) {

			int boardIngredientResult = 0;
			int boardContentResult = 0;

			// 사용자 레시피 식재료 저장
			for (int i = 0; i < boardFormBean.getBig_name().length; i++) {
				BoardIngredientBean boardIngredientBean = new BoardIngredientBean();
				boardIngredientBean.setBigName(boardFormBean.getBig_name()[i]);
				boardIngredientBean.setBigAmount(
						boardFormBean.getBig_amount()[i].equals("") ? "" : boardFormBean.getBig_amount()[i]);
				boardIngredientBean.setIngNum(boardFormBean.getIng_num()[i]);
				boardIngredientResult += bdao.insertBoardIngredient(boardIngredientBean);

			}

			// 사용자 레시피 조리과정 저장
			for (int i = 0; i < boardFormBean.getImage().length; i++) {
				if (!boardFormBean.getImage()[i].equals("")) {
					uuid = UUID.randomUUID().toString();
					imgName = boardFormBean.getImage()[i].split("\\.");
				}
				BoardContentBean boardContentBean = new BoardContentBean();
				boardContentBean
						.setImage(boardFormBean.getImage()[i].equals("") ? "" : imgName[0] + uuid + "." + imgName[1]);
				boardContentBean
						.setOriginImage(boardFormBean.getImage()[i].equals("") ? "" : boardFormBean.getImage()[i]);

				if (boardFormBean.getBod_content().length == 0) { // bodContent가 1개일때 입력안하면 못가져와서 처리해주는 부분
					boardContentBean.setBodContent("");
				} else {
					boardContentBean.setBodContent(
							boardFormBean.getBod_content()[i].equals("") ? "" : boardFormBean.getBod_content()[i]);
				}

				boardContentResult = bdao.insertBoardContent(boardContentBean);

				if (boardContentResult > 0 && !boardFormBean.getImage()[i].equals("")) {
					destination = new File(
							uploadPath + File.separator + boardFormBean.getUpload()[i].getOriginalFilename());
					destination_local = new File(str + File.separator + boardContentBean.getImage());
					destination_local_in = new File(uploadPath + File.separator + boardContentBean.getImage());
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

				}
			}

		}

		return page;

	}

}
