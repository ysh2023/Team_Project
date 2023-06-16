package ingredient.model;

import org.springframework.web.multipart.MultipartFile;

public class IngBean {
	private int ingnum;
	private String ingcategory;
	private String ingname;
	private int expiry;
	private String ingicon;
	
	private String origin;	//기존 파일명
	private MultipartFile upload;	//업로드 파일
	
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		
		String fileName = upload.getOriginalFilename();
		this.ingicon = fileName;
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
	
}
