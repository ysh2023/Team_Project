package basket.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import order.model.OrderBean;


@Component
public class BasketDao {
private String namespace = "basket.model.Basket";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public BasketDao() {
		//System.out.println("BasketDao()");
	}

	public int insertBasket(BasketBean bb) {
		System.out.println("basketid:"+bb.getBskid());
		System.out.println("basketpdnum:"+bb.getBskpdnum());
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace+".InsertBasket",bb);
		
		return cnt;
		
	}

	public List<JoinBean> getBasketList(String bskid) {
		List<JoinBean> lists = new ArrayList<JoinBean>();
		lists = sqlSessionTemplate.selectList(namespace+".getBasketList",bskid);
		for(int i=0;i<lists.size();i++) {
			lists.get(i);
		}
		return lists;
	}

	public BasketBean getBasketnum(int pdnum) {
		BasketBean bb2 = new BasketBean();
		bb2 = sqlSessionTemplate.selectOne(namespace+".getBasketNum", pdnum);
		System.out.println("bb2:"+bb2);
		return bb2;
	}

	public int deleteBasket(int bsknum) {
		int cnt = sqlSessionTemplate.delete(namespace+".deleteNumBasket",bsknum);
		return cnt;
	}

	public int updateBasket(BasketBean bb) {
		int cnt = sqlSessionTemplate.update(namespace+".updateBasket",bb);
		return cnt;
	}

	public int deleteIdBasket(String id) {
		int cnt = sqlSessionTemplate.delete(namespace+".deleteIdBasket",id);
		System.out.println("iddeletecnt:"+cnt);
		return cnt;
	}


	public List<BasketBean> getBasketNullList(int pdnum, String id) {
		List<BasketBean> lists = new ArrayList<BasketBean>();
		BasketBean bb3 = new BasketBean();
		bb3.setBskid(id);
		bb3.setBskpdnum(pdnum);
		lists = sqlSessionTemplate.selectList(namespace+".getBasketNullList",bb3);
		return lists;
	}

	public List<BasketBean> getBasketListB(String bskid) {
		List<BasketBean> lists = new ArrayList<BasketBean>();
		lists = sqlSessionTemplate.selectList(namespace+".getBasketListB",bskid);
		for(int i=0;i<lists.size();i++) {
			lists.get(i);
		}
		return lists;
	}

	public BasketBean getByNumBasket(int bsknum) {
		BasketBean bb3 = new BasketBean();
		bb3 = sqlSessionTemplate.selectOne(namespace+".getByNumBasket", bsknum);
		System.out.println("bb3:"+bb3);
		return bb3;
	}

	public int BasketCount(String id) {
		int count= sqlSessionTemplate.selectOne(namespace+".getBasketCount",id);
		return count;
	}

	
}
