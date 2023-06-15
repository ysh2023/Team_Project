package member.model;

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


}
