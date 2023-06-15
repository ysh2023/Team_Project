package mypage.model;

public class DibsBean {
	private int dibsnum;
	private String dibsid;
	private String dibspdnum;
	private int pdnum;
	private String  pdname;
	private String pdprice;
	private String pdimage;
	
	public DibsBean() {
		super();
	}
	
	
	public DibsBean(int dibsnum, String dibsid, String dibspdnum, int pdnum, String pdname, String pdprice,
			String pdimage) {
		super();
		this.dibsnum = dibsnum;
		this.dibsid = dibsid;
		this.dibspdnum = dibspdnum;
		this.pdnum = pdnum;
		this.pdname = pdname;
		this.pdprice = pdprice;
		this.pdimage = pdimage;
	}


	public int getPdnum() {
		return pdnum;
	}


	public void setPdnum(int pdnum) {
		this.pdnum = pdnum;
	}


	public String getPdname() {
		return pdname;
	}


	public void setPdname(String pdname) {
		this.pdname = pdname;
	}


	public String getPdprice() {
		return pdprice;
	}


	public void setPdprice(String pdprice) {
		this.pdprice = pdprice;
	}


	public String getPdimage() {
		return pdimage;
	}


	public void setPdimage(String pdimage) {
		this.pdimage = pdimage;
	}


	public int getDibsnum() {
		return dibsnum;
	}
	public void setDibsnum(int dibsnum) {
		this.dibsnum = dibsnum;
	}
	public String getDibsid() {
		return dibsid;
	}
	public void setDibsid(String dibsid) {
		this.dibsid = dibsid;
	}
	public String getDibspdnum() {
		return dibspdnum;
	}
	public void setDibspdnum(String dibspdnum) {
		this.dibspdnum = dibspdnum;
	}
	
	
}
