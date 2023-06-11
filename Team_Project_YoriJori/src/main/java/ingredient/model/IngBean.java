package ingredient.model;

public class IngBean {
	private int ingnum;
	private String ingcategory;
	private String ingname;
	private int expiry;
	private String ingicon;
	
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
