package shopmemo.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component(value = "memo")
public class MemoDao {
	private String namespace = "shopmemo.model.ShopMemo";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MemoBean> getUserMemo(String id) {
		List<MemoBean> allList = new ArrayList<MemoBean>();

		allList = sqlSessionTemplate.selectList(namespace+".GetUserMemo", id);
		
		return allList;
	}

	public int writeMemo(MemoBean memobean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace+".WriteMemo",memobean);
		
		return cnt;
	}

	public MemoBean GetMemoDetail(int memonum) {
		MemoBean memobean = new MemoBean();
		memobean = sqlSessionTemplate.selectOne(namespace+".GetMemoDetail", memonum);
		
		return memobean;
	}

	public int updateMemo(Map<String,Integer> map) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.update(namespace+".UpdateMemo",map);
		
		return cnt;
	}

	public int deleteMemo(int memonum) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.delete(namespace+".DeleteMemo",memonum);
		
		return cnt;
	}

	public int getTotalCount(String id) {
		int total = sqlSessionTemplate.selectOne(namespace+".TotalCount", id);
		
		return total;
	}
	
}
