package mypage.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import product.model.ProductBean;
import utility.Paging;

@Component("myDibsDao")
public class DibsDao {

private String namespace ="mypage.model.Mypage";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public DibsDao() {
		//System.out.println("DibsDao()");
	}


	public void insertDibs(Map<String, String> map) {
		sqlSessionTemplate.insert(namespace+".InsertDibs",map);
	}



	public List<ProductBean> getAllDibs(String user_id) {
		List<ProductBean> lists= new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllDibs",user_id);
		
		return lists;
	}


	public int getTotalCount(String id) {

		int count= sqlSessionTemplate.selectOne(namespace+".GetTotalCount",id);
		return count;
	}


	public DibsBean getDibsByNum(Map<String, String> map) {
		DibsBean dbean= sqlSessionTemplate.selectOne(namespace+".GetDibsByNum",map);
		
		
		return dbean;
	}


	public void deleteDibs(Map<String, String> map) {

		sqlSessionTemplate.delete(namespace+".DeleteDibs",map);
		
	}
}
	