package orderdetail.model;

public class OrderDetailBean {
	private int odtnum;
	private String odtordnum;
	private int odtpdnum;
	private int odtqty;
	private int odtprice;
	private String odtid;
	
	public OrderDetailBean() {
		
	}
	public OrderDetailBean(int odtnum, String odtordnum, int odtpdnum, int odtqty, int odtprice, String odtid) {
		super();
		this.odtnum = odtnum;
		this.odtordnum = odtordnum;
		this.odtpdnum = odtpdnum;
		this.odtqty = odtqty;
		this.odtprice = odtprice;
		this.odtid = odtid;
	}
	public int getOdtnum() {
		return odtnum;
	}
	public void setOdtnum(int odtnum) {
		this.odtnum = odtnum;
	}
	public String getOdtordnum() {
		return odtordnum;
	}
	public void setOdtordnum(String odtordnum) {
		this.odtordnum = odtordnum;
	}
	public int getOdtpdnum() {
		return odtpdnum;
	}
	public void setOdtpdnum(int odtpdnum) {
		this.odtpdnum = odtpdnum;
	}
	public int getOdtqty() {
		return odtqty;
	}
	public void setOdtqty(int odtqty) {
		this.odtqty = odtqty;
	}
	public int getOdtprice() {
		return odtprice;
	}
	public void setOdtprice(int odtprice) {
		this.odtprice = odtprice;
	}
	public String getOdtid() {
		return odtid;
	}
	public void setOdtid(String odtid) {
		this.odtid = odtid;
	}
	
	
	
	
	
}
