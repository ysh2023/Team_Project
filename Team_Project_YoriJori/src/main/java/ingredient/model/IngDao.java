package ingredient.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class IngDao {

private String namespace = "ingredient.model.Ingredient";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<IngBean> getIngbyCtg(String category) {
		List<IngBean> ingList = new ArrayList<IngBean>();
		
		ingList = sqlSessionTemplate.selectList(namespace+".GetIngbyCtg",category);
		
		return ingList;
	}

	public IngBean getIngInfo(int num) {
		IngBean ingbean = sqlSessionTemplate.selectOne(namespace+".GetIngInfo", num);
		
		return ingbean;
	}

}
