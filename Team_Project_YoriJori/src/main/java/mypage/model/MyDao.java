package mypage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.model.BoardBean;
import board.model.CommentsBean;

@Component
public class MyDao {
	private final String namespace = "mypage.model.Mypage";

	@Autowired
	SqlSessionTemplate sessionTemplate;

	public List<BoardBean> getAllMyBoard(String id) {
		List<BoardBean> list = sessionTemplate.selectList(namespace + ".GetAllMyBoard", id);
		return list;
	}

	public int deleteBoard(String bodNum) {
		int cnt = -1;
		cnt = sessionTemplate.delete(namespace + ".DeleteMyBoard", bodNum);
		return cnt;
	}

	public List<CommentsBean> getAllMyComment(String id) {
		List<CommentsBean> list = null;
		try {
			list = sessionTemplate.selectList(namespace + ".GetAllMyComment", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list.size());
		return list;
	}

	public int deleteMyComment(Map<String, String> map) {
		int cnt = -1;
		cnt = sessionTemplate.delete(namespace + ".DeleteMyComment", map);
		return cnt;
	}

	public List<BoardBean> getAllMyRecommend(String id) {
		List<BoardBean> list = sessionTemplate.selectList(namespace + ".GetAllMyRecommend", id);
		return list;
	}

	public int deleteMyRecommend(String recNum) {
		int cnt = -1;
		cnt = sessionTemplate.delete(namespace + ".DeleteMyRecommend", recNum);
		return cnt;
	}

}
