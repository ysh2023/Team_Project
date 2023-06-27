package order.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component()
public class OrderDao {
private String namespace = "order.model.Order";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public OrderDao() {
		//System.out.println("orderDao()");
	}
	
	
	public List<OrderBean> getAllProduct(Map<String, String> map) {
		List<OrderBean> lists= new ArrayList<OrderBean>();

		lists = sqlSessionTemplate.selectList(namespace+".GetAllOrder",map);
		
		return lists;
	}


	public int insertOrder(OrderBean ob) {
		int cnt = 0;
		cnt = sqlSessionTemplate.insert(namespace+".InsertOrder",ob);
		return cnt;
	}


	public List<OrderBean> getByIdOrder(String id) {
		List<OrderBean> lists = new ArrayList<OrderBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetByIdOrder",id);
		return lists;
	}
	
	public int updatePaystate(String merchantuid) {
		OrderBean ord = new OrderBean();
		ord.setOrdnum(merchantuid);
		ord.setOrdtel("환불 요청");
		int cnt = 0;
		cnt = sqlSessionTemplate.update(namespace+".RequestCancelpay",ord);
		return cnt;
	}


	public int getTotalCount(String id) {
		int count= sqlSessionTemplate.selectOne(namespace+".GetTotalCount",id);
		return count;
	}
}
