package board.model;

public class BoardBean {
	private int bodNum;
	private String title;
	private int servings;
	private int time;
	private String category;
	private String tags;
	private String id;
	private String bodImage;
	private String bodOrigin;
	private String rec;

	public String getBodOrigin() {
		return bodOrigin;
	}

	public void setBodOrigin(String bodOrigin) {
		this.bodOrigin = bodOrigin;
	}

	public String getRec() {
		return rec;
	}

	public void setRec(String rec) {
		this.rec = rec;
	}

	public int getBodNum() {
		return bodNum;
	}

	public void setBodNum(int bodNum) {
		this.bodNum = bodNum;
	}

	public String getBodImage() {
		return bodImage;
	}

	public void setBodImage(String bodImage) {
		this.bodImage = bodImage;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getServings() {
		return servings;
	}

	public void setServings(int servings) {
		this.servings = servings;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
