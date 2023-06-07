package admin.moel;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import product.model.ProductBean;

@Component("myAdminDao")
public class AdminDao {
	private String namespace = "admin.model.Admin";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<ProductBean> getAllProduct() {

		List<ProductBean> lists= new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllProduct"); 
		return lists;
	}

	public int deleteProduct(int pdnum) {

	int cnt=-1;
	cnt= sqlSessionTemplate.delete(namespace+".DeleteProduct",pdnum);
	
	return cnt;
	}

	public int insertProduct(ProductBean product) {
		int cnt=-1;
		
		System.out.println(product.getPdcategory());
		System.out.println(product.getPdimage());
		System.out.println(product.getPdname());
		System.out.println(product.getPdstock());
		System.out.println(product.getPdcontent());
		
		cnt= sqlSessionTemplate.insert(namespace+".InsertProduct",product);
		
		
		
		return cnt;
		
	}

}
