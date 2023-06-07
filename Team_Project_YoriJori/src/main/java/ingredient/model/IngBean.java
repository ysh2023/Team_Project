package ingredient.model;

public class IngBean {
	private int ingNum;
	private String ingCategory;
	private String ingName;
	private int expiry;

	public int getIngNum() {
		return ingNum;
	}

	public void setIngNum(int ing_num) {
		this.ingNum = ing_num;
	}

	public String getIngCategory() {
		return ingCategory;
	}

	public void setIngCategory(String ing_category) {
		this.ingCategory = ing_category;
	}

	public String getIngName() {
		return ingName;
	}

	public void setIngName(String ing_name) {
		this.ingName = ing_name;
	}

	public int getExpiry() {
		return expiry;
	}

	public void setExpiry(int expiry) {
		this.expiry = expiry;
	}

}
