package order.model;

public class OrderBean {
	private String ordnum;
	private String ordpdname;
	private int ordtotalpay;
	private String ordemail;
	private String ordname;
	private String ordtel;
	private String ordaddr;
	private String ordzipcode;
	private String ordmemid;
	private String orddate;
	private String ordpaystate;
	
	public OrderBean() {
		
	}
	public OrderBean(String ordnum, String ordpdname, int ordtotalpay, String ordemail, String ordname, String ordtel,
			String ordaddr, String ordzipcode,String ordmemid,String orddate,String ordpaystate) {
		super();
		this.ordnum = ordnum;
		this.ordpdname = ordpdname;
		this.ordtotalpay = ordtotalpay;
		this.ordemail = ordemail;
		this.ordname = ordname;
		this.ordtel = ordtel;
		this.ordaddr = ordaddr;
		this.ordzipcode = ordzipcode;
		this.ordmemid = ordmemid;
		this.orddate = orddate;
		this.ordpaystate = ordpaystate;
	}
	public String getOrdnum() {
		return ordnum;
	}
	public void setOrdnum(String ordnum) {
		this.ordnum = ordnum;
	}
	public String getOrdpdname() {
		return ordpdname;
	}
	public void setOrdpdname(String ordpdname) {
		this.ordpdname = ordpdname;
	}
	public int getOrdtotalpay() {
		return ordtotalpay;
	}
	public void setOrdtotalpay(int ordtotalpay) {
		this.ordtotalpay = ordtotalpay;
	}
	public String getOrdemail() {
		return ordemail;
	}
	public void setOrdemail(String ordemail) {
		this.ordemail = ordemail;
	}
	public String getOrdname() {
		return ordname;
	}
	public void setOrdname(String ordname) {
		this.ordname = ordname;
	}
	public String getOrdtel() {
		return ordtel;
	}
	public void setOrdtel(String ordtel) {
		this.ordtel = ordtel;
	}
	public String getOrdaddr() {
		return ordaddr;
	}
	public void setOrdaddr(String ordaddr) {
		this.ordaddr = ordaddr;
	}
	public String getOrdzipcode() {
		return ordzipcode;
	}
	public void setOrdzipcode(String ordzipcode) {
		this.ordzipcode = ordzipcode;
	}
	public String getOrdmemid() {
		return ordmemid;
	}
	public void setOrdmemid(String ordmemid) {
		this.ordmemid = ordmemid;
	}
	public String getOrddate() {
		return orddate;
	}
	public void setOrddate(String orddate) {
		this.orddate = orddate;
	}
	public String getOrdpaystate() {
		return ordpaystate;
	}
	public void setOrdpaystate(String ordpaystate) {
		this.ordpaystate = ordpaystate;
	}
	
	
}
