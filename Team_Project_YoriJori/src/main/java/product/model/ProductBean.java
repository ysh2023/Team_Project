package product.model;

import org.springframework.web.multipart.MultipartFile;

public class ProductBean {

	private int pdnum;
	private String pdimage;
	private String pdname;
	private int pdprice;
	private int pdstock;
	private String pdcategory;
	private String pdcontent;
	
	private MultipartFile upload;
	private String upload2;
	
	public String getUpload2() {
		return upload2;
	}
	public void setUpload2(String upload2) {
		this.upload2 = upload2;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		
		String fileName = upload.getOriginalFilename();
		this.pdimage = fileName;
	}
	
	public ProductBean() {
		super();
		
	}
	public ProductBean(int pdnum, String pdimage, String pdname, int pdprice, int pdstock, String pdcategory,
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
	public int getPdprice() {
		return pdprice;
	}
	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}
	public int getPdstock() {
		return pdstock;
	}
	public void setPdstock(int pdstock) {
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
