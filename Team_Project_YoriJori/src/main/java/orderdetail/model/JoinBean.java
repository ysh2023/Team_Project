package orderdetail.model;

public class JoinBean {
	private String odtordnum;
	private String pdname;
	private String pdimage;
	private int pdprice;
	private int odtqty;
	
	public JoinBean() {
		
	}
	public JoinBean(String odtordnum, String pdname, String pdimage, int pdprice, int odtqty) {
		super();
		this.odtordnum = odtordnum;
		this.pdname = pdname;
		this.pdimage = pdimage;
		this.pdprice = pdprice;
		this.odtqty = odtqty;
	}
	public String getOdtordnum() {
		return odtordnum;
	}
	public void setOdtordnum(String odtordnum) {
		this.odtordnum = odtordnum;
	}
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public String getPdimage() {
		return pdimage;
	}
	public void setPdimage(String pdimage) {
		this.pdimage = pdimage;
	}
	public int getPdprice() {
		return pdprice;
	}
	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}
	public int getOdtqty() {
		return odtqty;
	}
	public void setOdtqty(int odtqty) {
		this.odtqty = odtqty;
	}
	
	
}
