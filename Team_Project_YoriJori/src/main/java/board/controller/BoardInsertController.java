package board.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

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

@Controller
public class BoardInsertController {
	private final String command = "write.board";
	private String formPage = "boardWriteForm";
	private String page = "redirect:/main.board";

	@Autowired
	ServletContext servletContext;

	@Autowired
	BoardDao bdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model, HttpSession session, HttpServletResponse response) throws IOException {
		if (session.getAttribute("loginInfo") == null) {
			response.setContentType("text/html; charset=utf-8");
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
//		boardBean.setId(((MemberBean) session.getAttribute("loginInfo")).getId());
		boardBean.setId("admin");
		boardBean.setBodImage(boardFormBean.getBod_image());
		int boardResult = bdao.insertBoard(boardBean);

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
			int boardIngredientResult = 0;
			int boardContentResult = 0;

			String big_name[] = boardFormBean.getBig_name().split(",");
			for (int i = 0; i < big_name.length; i++) {
				BoardIngredientBean boardIngredientBean = new BoardIngredientBean();
				boardIngredientBean.setBigName(big_name[i]);
				boardIngredientResult += bdao.insertBoardIngredient(boardIngredientBean);
			}
			for (int i = 0; i < boardFormBean.getBod_content().length; i++) {
				BoardContentBean boardContentBean = new BoardContentBean();
				boardContentBean.setImage(boardFormBean.getImage()[i] == null ? "" : boardFormBean.getImage()[i]);
				boardContentBean.setBodContent(
						boardFormBean.getBod_content()[i] == null ? "" : boardFormBean.getBod_content()[i]);
				boardContentResult += bdao.insertBoardContent(boardContentBean);
			}
			System.out.println("content : " + boardContentResult);
			System.out.println("식재료 : " + boardIngredientResult);
			if (boardContentResult > 0) {

				for (int i = 0; i < boardFormBean.getUpload().length; i++) {
					destination = new File(
							uploadPath + File.separator + boardFormBean.getUpload()[i].getOriginalFilename());
					destination_local = new File(
							str + File.separator + boardFormBean.getUpload()[i].getOriginalFilename());
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

		}

		return page;

	}

}
