package board.model;

public class CommentReportBean {
	private int repNum;
	private String reasons;
	private int comNum;
	private String id;
	private String repDiscription;

	public String getRepDiscription() {
		return repDiscription;
	}

	public void setRepDiscription(String repDiscription) {
		this.repDiscription = repDiscription;
	}

	public int getRepNum() {
		return repNum;
	}

	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}

	public String getReasons() {
		return reasons;
	}

	public void setReasons(String reasons) {
		this.reasons = reasons;
	}

	public int getComNum() {
		return comNum;
	}

	public void setComNum(int comNum) {
		this.comNum = comNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
