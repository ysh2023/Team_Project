package basket.model;

public class JoinBean {
	private int bsknum;
	private String pdname;
	private String pdimage;
	private int pdprice;
	private int bskqty;
	public JoinBean() {
		
	}
	public JoinBean(int bsknum,String pdname,String pdimage, int pdprice, int bskqty) {
		super();
		this.bsknum = bsknum;
		this.pdname = pdname;
		this.pdimage = pdimage;
		this.pdprice = pdprice;
		this.bskqty = bskqty;
	}
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public int getPdprice() {
		return pdprice;
	}
	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}
	public int getBskqty() {
		return bskqty;
	}
	public void setBskqty(int bskqty) {
		this.bskqty = bskqty;
	}
	public String getPdimage() {
		return pdimage;
	}
	public void setPdimage(String pdimage) {
		this.pdimage = pdimage;
	}
	public int getBsknum() {
		return bsknum;
	}
	public void setBsknum(int bsknum) {
		this.bsknum = bsknum;
	}
	
	
}
