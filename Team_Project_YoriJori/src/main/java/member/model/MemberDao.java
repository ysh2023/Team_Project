package member.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMemberDao")
public class MemberDao {
	
	private String namespace = "member.model.Member";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;



	public MemberBean GetMemberById(String id) {
		MemberBean member= new MemberBean();
		member = sqlSessionTemplate.selectOne(namespace+".GetMemberById",id); 
		return member;
	}
	
	public int insertMember(MemberBean mb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertMember", mb);

		return cnt;
	}

	public int updateMember(MemberBean mb) {
		int cnt=-1;
		
		cnt=sqlSessionTemplate.update(namespace + ".UpdatetMember", mb);
		
		
		return cnt;
	}

	public int deleteMember(String id) {
		int cnt=-1;
		
		cnt=sqlSessionTemplate.delete(namespace + ".DeleteMember", id);
		
		return cnt;
		
	}



	public boolean searchStopById(String id) throws ParseException {
		
		boolean check=false;
		
		System.out.println("id"+id);
		
		StopBean sb=sqlSessionTemplate.selectOne(namespace+".SearchStopById",id);
		
		if(sb==null) {
			return check;
		}else {
		
		Date date1 = new Date();
		Date date2 = new Date();
		 
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		date1=format.parse(format.format(date1));
		date2=format.parse(sb.getStopdate());
		
		System.out.println(date1.compareTo(date2));
		if(date1.compareTo(date2)<=0) {
			System.out.println("정지안지남.");
			check=true;
		}else {
			System.out.println("정지지남");
		}
		return check;
	}
	}
	
	public List<StopBean> getAllStop(){
		List<StopBean> lists= new ArrayList<StopBean>();
		
		lists= sqlSessionTemplate.selectList(namespace+".GetAllStop");
		return lists;
	}

	public void insertStop(StopBean sb) {
		sqlSessionTemplate.insert(namespace+".InsertStop",sb);
	}

	public void updateStop(StopBean sb) {
		sqlSessionTemplate.update(namespace+".UpdateStop",sb);		
	}

	public void deleteStop(String id) {
		sqlSessionTemplate.update(namespace+".DeleteStop",id);	
	}


}
