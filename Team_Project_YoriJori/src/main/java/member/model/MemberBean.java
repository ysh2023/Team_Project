package member.model;

import org.hibernate.validator.constraints.NotBlank;

public class MemberBean {
	private String id;
	private String mname;
	private String pw;
	private int tel;
	private int age;
	private String area1;
	private String area2;


	public MemberBean() {
		super();
	}
	
	
	public MemberBean(String id, String mname, String pw, int tel, int age, String area1, String area2) {
		super();
		this.id = id;
		this.mname = mname;
		this.pw = pw;
		this.tel = tel;
		this.age = age;
		this.area1 = area1;
		this.area2 = area2;
	}




	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public int getTel() {
		return tel;
	}


	public void setTel(int tel) {
		this.tel = tel;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getArea1() {
		return area1;
	}


	public void setArea1(String area1) {
		this.area1 = area1;
	}


	public String getArea2() {
		return area2;
	}


	public void setArea2(String area2) {
		this.area2 = area2;
	}
	
	

}