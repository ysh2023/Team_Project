package orderdetail.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component()
public class OrderDetailDao {
private String namespace = "orderDetail.model.OrderDetail";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public OrderDetailDao() {
		//System.out.println("OrderDetailDao()");
	}

	public int insertOrderDetail(OrderDetailBean odt) {
		int cnt = 0;
		cnt = sqlSessionTemplate.insert(namespace+".InsertOrderDetail",odt);
		return cnt;
	}

	public List<OrderDetailBean> getByOrdnum(String ordnum) {
		List<OrderDetailBean> lists = new ArrayList<OrderDetailBean>();
		lists = sqlSessionTemplate.selectList(namespace+".getByOrdnum",ordnum);
		return lists;
	}

}
