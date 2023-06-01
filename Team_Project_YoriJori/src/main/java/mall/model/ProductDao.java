package mall.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("myProductDao")
public class ProductDao {

private String namespace = "mall.model.MallBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ProductDao() {
		System.out.println("ProductDao()");
	}
	
	
	public List<ProductBean> getAllProduct(Map<String, String> map) {
		List<ProductBean> lists= new ArrayList<ProductBean>();

		lists = sqlSessionTemplate.selectList(namespace+".GetAllProduct",map);
		
		return lists;
	}

}
