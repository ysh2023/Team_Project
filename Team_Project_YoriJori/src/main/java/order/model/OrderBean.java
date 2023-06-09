package order.model;

public class OrderBean {
	private String ordnum;
	private String ordpdname;
	private int ordtotalprice;
	private String ordemail;
	private String ordname;
	private String ordtel;
	private String ordaddr;
	private String ordzipcode;
	private String ordmemid;
	
	public OrderBean() {
		
	}
	public OrderBean(String ordnum, String ordpdname, int ordtotalprice, String ordemail, String ordname, String ordtel,
			String ordaddr, String ordzipcode,String ordmemid) {
		super();
		this.ordnum = ordnum;
		this.ordpdname = ordpdname;
		this.ordtotalprice = ordtotalprice;
		this.ordemail = ordemail;
		this.ordname = ordname;
		this.ordtel = ordtel;
		this.ordaddr = ordaddr;
		this.ordzipcode = ordzipcode;
		this.ordmemid = ordmemid;
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
	public int getOrdtotalprice() {
		return ordtotalprice;
	}
	public void setOrdtotalprice(int ordtotalprice) {
		this.ordtotalprice = ordtotalprice;
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
	
	
}
