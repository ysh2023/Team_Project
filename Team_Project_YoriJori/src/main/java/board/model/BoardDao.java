package board.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BoardDao {
	private final String namespace = "board.model.Board";

	@Autowired
	SqlSessionTemplate sessionTemplate;

	public List<BoardBean> getAllBoard(Map<String, String> map) {
		List<BoardBean> list = sessionTemplate.selectList(namespace + ".GetAllBoard", map);
		return list;
	}

	public int insertBoard(BoardBean boardBean) {
		int cnt = -1;
		cnt = sessionTemplate.insert(namespace + ".InsertBoard", boardBean);
		return cnt;
	}

	public List<String> getAllCategory() {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertBoardContent(BoardContentBean boardContentBean) {
		int cnt = -1;
		cnt = sessionTemplate.insert(namespace + ".InsertBoardContent", boardContentBean);
		return cnt;
	}

	public int insertBoardIngredient(BoardIngredientBean boardIngredientBean) {
		int cnt = -1;
		cnt = sessionTemplate.insert(namespace + ".InsertBoardIngredient", boardIngredientBean);
		return cnt;
	}

	public List<BoardBean> getTopBoard() {
		List<BoardBean> boardList = sessionTemplate.selectList(namespace + ".GetTopBoard");

		return boardList;
	}

	public BoardBean getBoardByBodNum(String bodNum) {
		BoardBean boardBean = sessionTemplate.selectOne(namespace + ".GetBoardByBodNum", bodNum);
		return boardBean;
	}

	public List<BoardContentBean> getBoardContentByBodNum(String bodNum) {
		List<BoardContentBean> list = sessionTemplate.selectList(namespace + ".GetBoardContentByBodNum", bodNum);
		return list;
	}

	public List<CommentBean> getCommentByBodNum(String bodNum) {
		List<CommentBean> list = sessionTemplate.selectList(namespace + ".GetCommentByBodNum", bodNum);
		return list;
	}

}
