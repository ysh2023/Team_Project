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
	private String namespace = "refrigerator.model.Refrigerator";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<RefBean> getUserRef(String id) {
		List<RefBean> refList = new ArrayList<RefBean>();

		refList = sqlSessionTemplate.selectList(namespace+".GetUserRef",id);
		
		return refList;
	}
	
}
