package orderdetail.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component()
public class OrderDetailDao {
private String namespace = "orderDetail.model.OrderDetail";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public OrderDetailDao() {
		System.out.println("OrderDetailDao()");
	}

	public int insertOrderDetail(OrderDetailBean odt) {
		int cnt = 0;
		cnt = sqlSessionTemplate.insert(namespace+".InsertOrderDetail",odt);
		return cnt;
	}

}
