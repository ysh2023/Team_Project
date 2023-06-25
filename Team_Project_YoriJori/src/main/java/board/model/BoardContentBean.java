package board.model;

public class BoardContentBean {
	private int bimNum;
	private String image;
	private String originImage;
	private String bodContent;
	private int bodNum;

	public String getOriginImage() {
		return originImage;
	}

	public void setOriginImage(String originImage) {
		this.originImage = originImage;
	}

	public int getBimNum() {
		return bimNum;
	}

	public void setBimNum(int bim_num) {
		this.bimNum = bim_num;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getBodContent() {
		return bodContent;
	}

	public void setBodContent(String bod_content) {
		this.bodContent = bod_content;
	}

	public int getBodNum() {
		return bodNum;
	}

	public void setBodNum(int bod_num) {
		this.bodNum = bod_num;
	}
}
