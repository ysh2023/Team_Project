package basket.model;

public class BasketBean {
	private int bsknum;
	private String bskid;
	private int bskpdnum;
	private int bskqty;
	private String bskdate;
	
	public BasketBean() {
		
	}
	
	public BasketBean(int bsknum, String bskid, int bskpdnum, int bskqty, String bskdate) {
		super();
		this.bsknum = bsknum;
		this.bskid = bskid;
		this.bskpdnum = bskpdnum;
		this.bskqty = bskqty;
		this.bskdate = bskdate;
	}
	public int getBsknum() {
		return bsknum;
	}
	public void setBsknum(int bsknum) {
		this.bsknum = bsknum;
	}
	public String getBskid() {
		return bskid;
	}
	public void setBskid(String bskid) {
		this.bskid = bskid;
	}
	public int getBskpdnum() {
		return bskpdnum;
	}
	public void setBskpdnum(int bskpdnum) {
		this.bskpdnum = bskpdnum;
	}
	public int getBskqty() {
		return bskqty;
	}
	public void setBskqty(int bskqty) {
		this.bskqty = bskqty;
	}
	public String getBskdate() {
		return bskdate;
	}
	public void setBskdate(String bskdate) {
		this.bskdate = bskdate;
	}
	
	
	
}
