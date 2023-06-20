package refrigerator.model;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RefDao {
	private String namespace = "refrigerator.model.Refrigerator";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	/* 전체 재료 수 */
	public int getTotalCount(String id) {
		int totalCnt = -1;
		
		totalCnt = sqlSessionTemplate.selectOne(namespace+".TotalCount", id);
		
		return totalCnt;
	}
	
	/* 냉장보관 재료 수 */
	public int getRefCount(String id) {
		int refCnt = -1;
		
		refCnt = sqlSessionTemplate.selectOne(namespace+".RefCount", id);
		
		return refCnt;
	}
	
	/* 냉동보관 재료 수 */
	public int getFreezeCount(String id) {
		int freezeCnt = -1;
		
		freezeCnt = sqlSessionTemplate.selectOne(namespace+".FreezeCount", id);
		
		return freezeCnt;
	}
	
	/* 실온보관 재료 수 */
	public int getRoomCount(String id) {
		int roomCnt = -1;
		
		roomCnt = sqlSessionTemplate.selectOne(namespace+".RoomCount", id);
		
		return roomCnt;
	}
	
	/* 소비기한 D-3 이하 재료 수 */
	public int getDdayCount(String id) {
		int ddayCnt = -1;
		
		ddayCnt = sqlSessionTemplate.selectOne(namespace+".DdayCount", id);
		
		return ddayCnt;
	}
	
	/* 소비기한 D-3 이하 재료 리스트 */
	public List<JoinBean> getDdayIngList(String id) {
		List<JoinBean> ddayList = new ArrayList<JoinBean>();
		
		ddayList = sqlSessionTemplate.selectList(namespace+".GetDdayIng", id);
		
		return ddayList;
	}
	
	/* 전체 리스트 */
	public List<RefBean> getUserRef(Map<String, String> listMap) {
		List<RefBean> allList = new ArrayList<RefBean>();

		allList = sqlSessionTemplate.selectList(namespace+".GetUserRef", listMap);
		
		return allList;
	}
	
	/* 보관별 리스트 */
	public List<RefBean> getListbyStorage(Map<String, String> storageMap) {
		List<RefBean> storageList = new ArrayList<RefBean>();

		storageList = sqlSessionTemplate.selectList(namespace+".GetStorageList", storageMap);
		
		return storageList;
	}

	public int insertRef(RefBean refbean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace+".InsertRef",refbean);
		
		return cnt;
	}

	public JoinBean getRefDetail(Map<String, String> map) {
		JoinBean joinbean = new JoinBean();
		joinbean = sqlSessionTemplate.selectOne(namespace+".GetRefDetail", map);
		
		return joinbean;
	}

	public int updateRef(JoinBean joinbean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.update(namespace+".UpdateRef",joinbean);
		
		return cnt;
	}

	public int deleteRef(Map<String, String> map) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.delete(namespace+".DeleteRef",map);
		
		return cnt;
	}
	
}
