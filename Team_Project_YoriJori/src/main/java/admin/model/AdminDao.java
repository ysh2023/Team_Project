package admin.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import order.model.OrderBean;
import orderdetail.model.OrderDetailBean;
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

		cnt= sqlSessionTemplate.insert(namespace+".InsertProduct",product);
		
		
		
		return cnt;
		
	}
	
	public ProductBean getByNum(int pdnum) {
		ProductBean pd= sqlSessionTemplate.selectOne(namespace+".GetByNum",pdnum);
		
		return pd;
	}

	public int updateProduct(ProductBean productBean) {
		int cnt=-1;
		cnt=sqlSessionTemplate.update(namespace+".UpdateProduct",productBean);
		
		System.out.println("pd_num:"+productBean.getPdnum());
		System.out.println("pd_cate:"+productBean.getPdcategory());
		System.out.println("pd_image:"+productBean.getPdimage());
		return cnt;
		
	}

	public List<ProductBean> getAllMember() {
		List<ProductBean> lists= new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllMember"); 
		return lists;
	}

	public List<OrderBean> getAllOrder() {
		List<OrderBean> lists= new ArrayList<OrderBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllOrder"); 
		return lists;
	}

	public List<OrderDetailBean> getAllOrderDetail(String ordnum) {
		List<OrderDetailBean> lists= new ArrayList<OrderDetailBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllOrderDetail",ordnum); 
		return lists;
	}

}
