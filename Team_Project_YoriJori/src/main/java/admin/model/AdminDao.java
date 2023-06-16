package admin.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ingredient.model.IngBean;
import product.model.ProductBean;

@Component("myAdminDao")
public class AdminDao {
	private String namespace = "admin.model.Admin";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	/* 회원 */
	public List<ProductBean> getAllMember() {
		List<ProductBean> lists= new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllMember"); 
		return lists;
	}

	/* 상품 */
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
		ProductBean pd = sqlSessionTemplate.selectOne(namespace+".GetByNum",pdnum);
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
	
	/* 식재료 */
	public List<IngBean> getAllIng() {
		List<IngBean> allList = sqlSessionTemplate.selectList(namespace+".GetAllIng"); 
		return allList;
	}

	public IngBean getIngDetail(int ingnum) {
		IngBean ingbean = sqlSessionTemplate.selectOne(namespace+".GetIngDetail",ingnum);
		return ingbean;
	}
	
	public int checkIng(String ingname) {
		int dupl = sqlSessionTemplate.selectOne(namespace+".CheckIng",ingname);
		return dupl;
	}
	
	public int insertIng(IngBean ingbean) {
		int cnt = sqlSessionTemplate.insert(namespace+".InsertIng", ingbean);
		return cnt;
	}

	public int updateIng(IngBean ingbean) {
		int cnt = sqlSessionTemplate.update(namespace+".UpdateIng", ingbean);
		return cnt;
	}
	
	public int checkRef(int ingnum) {
		int used = sqlSessionTemplate.selectOne(namespace+".CheckRef",ingnum);
		return used;
	}
	
	public int deleteIng(int ingnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteIng", ingnum);
		return cnt;
	}
	

}
