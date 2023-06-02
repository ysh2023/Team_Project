package refrigerator.model;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RefDao {
	private String namespace = "refrigerator.model.Refrigerator";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<RefBean> getUserRef(String id) {
		List<RefBean> refList = new ArrayList<RefBean>();

		refList = sqlSessionTemplate.selectList(namespace+".GetUserRef",id);
		
		return refList;
	}

	public int insertRef(RefBean refbean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace+".InsertRef",refbean);
		
		return cnt;
	}
	
}
