package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;



@Component("myProductDao")
public class ProductDao {

private String namespace = "product.model.Product";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ProductDao() {
		System.out.println("ProductDao()");
	}
	
	
	public List<ProductBean> getAllProduct(Paging pageInfo, Map<String, String> map) {
		List<ProductBean> lists= new ArrayList<ProductBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".GetAllProduct",map,rowBounds);
		
		return lists;
	}


	public int getTotalCount(Map<String, String> map) {
		int totalCount=0;
		
		totalCount=sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return totalCount;
	}


	public ProductBean getByNum(int pdnum) {
		ProductBean pd= sqlSessionTemplate.selectOne(namespace+".GetByNum",pdnum);
		
		return pd;
	}

}
