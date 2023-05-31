package mall.model;

public class ProductBean {

	private int pdnum;
	private String pdimage;
	private String pdname;
	private String pdprice;
	private String pdstock;
	private String pdcategory;
	private String pdcontent;
	
	public ProductBean() {
		super();
	}
	public ProductBean(int pdnum, String pdimage, String pdname, String pdprice, String pdstock, String pdcategory,
			String pdcontent) {
		super();
		this.pdnum = pdnum;
		this.pdimage = pdimage;
		this.pdname = pdname;
		this.pdprice = pdprice;
		this.pdstock = pdstock;
		this.pdcategory = pdcategory;
		this.pdcontent = pdcontent;
	}
	public int getPdnum() {
		return pdnum;
	}
	public void setPdnum(int pdnum) {
		this.pdnum = pdnum;
	}
	public String getPdimage() {
		return pdimage;
	}
	public void setPdimage(String pdimage) {
		this.pdimage = pdimage;
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
	public void setPdaprice(String pdprice) {
		this.pdprice = pdprice;
	}
	public String getPdstock() {
		return pdstock;
	}
	public void setPdstock(String pdstock) {
		this.pdstock = pdstock;
	}
	public String getPdcategory() {
		return pdcategory;
	}
	public void setPdcategory(String pdcategory) {
		this.pdcategory = pdcategory;
	}
	public String getPdcontent() {
		return pdcontent;
	}
	public void setPdcontent(String pdcontent) {
		this.pdcontent = pdcontent;
	}
	
}
