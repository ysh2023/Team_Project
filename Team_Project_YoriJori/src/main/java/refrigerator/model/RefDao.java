package refrigerator.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import product.model.ProductBean;

@Component
public class RefDao {
	private String namespace = "mall.model.RefBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<RefBean> getUserRef(Map<String, String> map) {
		List<RefBean> lists= new ArrayList<RefBean>();

		lists = sqlSessionTemplate.selectList(namespace+".GetUserRef",map);
		
		return lists;
	}
	
}
