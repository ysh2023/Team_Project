package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import basket.model.BasketBean;
import utility.Paging;



@Component("myProductDao")
public class ProductDao {

private String namespace = "product.model.Product";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ProductDao() {
		//System.out.println("ProductDao()");
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


	public int updatePqty(int odtpdnum, int odtqty) {
		ProductBean pb = new ProductBean();
		pb.setPdnum(odtpdnum);
		pb.setPdstock(odtqty);
		
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateStock", pb);
		System.out.println("update cnt: "+ cnt);
		return cnt;
	}


	public List<ProductBean> getAllProducts() {
		List<ProductBean> lists= new ArrayList<ProductBean>();
		
		lists = sqlSessionTemplate.selectList(namespace+".GetAllProducts");
		
		return lists;
	}


	public ProductBean getByName(String pdname) {
		ProductBean pd= sqlSessionTemplate.selectOne(namespace+".GetByName",pdname);
		
		return pd;
	}




}
