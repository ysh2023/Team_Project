package board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ingredient.model.IngBean;
import utility.Paging;

@Component
public class BoardDao {
	private final String namespace = "board.model.Board";

	@Autowired
	SqlSessionTemplate sessionTemplate;

	public int getTotalCount(Map<String, String> map) {
		int cnt = 0;
		cnt = sessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}

	public List<BoardBean> getAllBoard(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<BoardBean> list = sessionTemplate.selectList(namespace + ".GetAllBoard", map, rowBounds);
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

	public int updateInsertBoardContent(BoardContentBean boardContentBean) {
		int cnt = -1;
		cnt = sessionTemplate.insert(namespace + ".UpdateInsertBoardContent", boardContentBean);
		return cnt;
	}

	public int insertBoardIngredient(BoardIngredientBean boardIngredientBean) {
		int cnt = -1;
		cnt = sessionTemplate.insert(namespace + ".InsertBoardIngredient", boardIngredientBean);
		return cnt;
	}

	public int updateInsertBoardIngredient(BoardIngredientBean boardIngredientBean) {
		int cnt = -1;
		cnt = sessionTemplate.insert(namespace + ".UpdateInsertBoardIngredient", boardIngredientBean);
		return cnt;
	}

	public List<BoardBean> getTopBoard() {
		RowBounds rowBounds = new RowBounds(0, 5);
		List<BoardBean> boardList = sessionTemplate.selectList(namespace + ".GetTopBoard", rowBounds);

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

	public List<CommentsBean> getCommentByBodNum(String bodNum) {
		List<CommentsBean> list = sessionTemplate.selectList(namespace + ".GetCommentByBodNum", bodNum);
		return list;
	}

	public List<String> getIngredientCategory() {
		List<String> list = sessionTemplate.selectList(namespace + ".GetIngredientCategory");
		return list;
	}

	public List<IngBean> getAllIngredient() {
		List<IngBean> list = sessionTemplate.selectList(namespace + ".GetAllIngredient");
		return list;
	}

	public List<BoardIngredientBean> getBoardIngredientByBodNum(String bodNum) {
		List<BoardIngredientBean> list = sessionTemplate.selectList(namespace + ".GetBoardIngredientByBodNum", bodNum);
		return list;
	}

	public int deleteBoardByBodNum(String bodNum) {
		int cnt = -1;
		cnt = sessionTemplate.delete(namespace + ".DeleteBoardByBodNum", bodNum);

		return cnt;
	}

	public int insertComment(CommentsBean commentsBean) {
		int cnt = -1;
		cnt = sessionTemplate.insert(namespace + ".InsertComment", commentsBean);
		return cnt;
	}

	public int deleteCommentByComNum(String comNum) {
		int cnt = -1;
		cnt = sessionTemplate.update(namespace + ".DeleteComment", comNum);
		return cnt;

	}

	public int ReplyUpdateByBodNum(CommentsBean commentsBean) {
		int cnt = -1;
		cnt = sessionTemplate.update(namespace + ".ReplyUpdate", commentsBean);
		return cnt;
	}

	public int insertReplyComment(CommentsBean commentsBean) {
		int cnt = -1;
		cnt = sessionTemplate.insert(namespace + ".ReplyInsert", commentsBean);
		return cnt;
	}

	public CommentsBean getCommentByComNum(String comNum) {
		CommentsBean commentsBean = sessionTemplate.selectOne(namespace + ".GetCommentsByComNum", comNum);
		return commentsBean;
	}

	public int getReplyInsertRefStep(CommentsBean commentsBean) {
		int cnt = 0;
		cnt = sessionTemplate.selectOne(namespace + ".GetReplyInsertRefStep", commentsBean);
		return cnt;
	}

	public int updateCommentByBodNum(CommentsBean commentsBean) {
		int cnt = -1;
		cnt = sessionTemplate.update(namespace + ".UpdateComment", commentsBean);
		return cnt;
	}

	public int insertCommentReport(CommentReportBean commentReportBean) {
		int cnt = -1;
		cnt = sessionTemplate.insert(namespace + ".InsertCommentReport", commentReportBean);
		return cnt;

	}

	public RecommendBean getRecommendByBodNumAndId(Map<String, String> map) {
		RecommendBean recommendBean = sessionTemplate.selectOne(namespace + ".GetRecommend", map);
		return recommendBean;
	}

	public int insertRecommend(Map<String, String> map) {
		int cnt = -1;
		cnt = sessionTemplate.insert(namespace + ".InsertRecommend", map);
		return cnt;
	}

	public int deleteRecommend(RecommendBean recommendBean) {
		int cnt = -1;
		cnt = sessionTemplate.delete(namespace + ".DeleteRecommend", recommendBean);
		return cnt;
	}

	public int updateBoard(BoardBean boardBean) {
		int cnt = -1;
		cnt = sessionTemplate.update(namespace + ".UpdateBoard", boardBean);
		return cnt;
	}

	public int deleteBoardIngredient(int bod_num) {
		int cnt = -1;
		cnt = sessionTemplate.update(namespace + ".DeleteBoardIngredient", bod_num);
		return cnt;
	}

	public int deleteBoardContent(int bod_num) {
		int cnt = -1;
		cnt = sessionTemplate.update(namespace + ".DeleteBoardContent", bod_num);
		return cnt;
	}

	public int getRefRecommendTotalCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sessionTemplate.selectOne(namespace + ".GetRefRecommendTotalCount", map);
		return cnt;
	}

	public List<BoardBean> getRefRecommendBoard(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<BoardBean> list = sessionTemplate.selectList(namespace + ".GetRefRecommendBoard", map, rowBounds);
		return list;
	}

	public List<String> getBoardContentImageByBodNum(String bodNum) {
		List<String> list = sessionTemplate.selectList(namespace + ".GetBoardContentImageByBodNum", bodNum);
		return list;
	}
}
