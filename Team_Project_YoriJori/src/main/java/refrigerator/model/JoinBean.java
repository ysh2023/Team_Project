package refrigerator.model;

public class JoinBean {
	private int refnum;
	private String id;
	private int ingnum;
	private String ingcategory;
	private String ingname;
	private int expiry;
	private String ingicon;
	private String inputdate;
	private String refdday;
	private String refstorage;
	private String refdetail;
	
	public int getRefnum() {
		return refnum;
	}
	public void setRefnum(int refnum) {
		this.refnum = refnum;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getIngnum() {
		return ingnum;
	}
	public void setIngnum(int ingnum) {
		this.ingnum = ingnum;
	}
	
	public String getIngcategory() {
		return ingcategory;
	}
	public void setIngcategory(String ingcategory) {
		this.ingcategory = ingcategory;
	}
	
	public String getIngname() {
		return ingname;
	}
	public void setIngname(String ingname) {
		this.ingname = ingname;
	}
	
	public int getExpiry() {
		return expiry;
	}
	public void setExpiry(int expiry) {
		this.expiry = expiry;
	}
	
	public String getIngicon() {
		return ingicon;
	}
	public void setIngicon(String ingicon) {
		this.ingicon = ingicon;
	}
	
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	
	public String getRefdday() {
		return refdday;
	}
	public void setRefdday(String refdday) {
		this.refdday = refdday;
	}
	
	public String getRefstorage() {
		return refstorage;
	}
	public void setRefstorage(String refstorage) {
		this.refstorage = refstorage;
	}
	
	public String getRefdetail() {
		return refdetail;
	}
	public void setRefdetail(String refdetail) {
		this.refdetail = refdetail;
	}
}
