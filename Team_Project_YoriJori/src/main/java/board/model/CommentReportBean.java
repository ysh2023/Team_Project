package board.model;

public class CommentReportBean {
	private int repNum;
	private String reasons;
	private int comNum;
	private String id;
	private String idOrigin;
	private String repDiscription;
	private String comcontent; // 해당 신고 댓글 내용 불러오기위해 넣음
	private String count;
	private int report;

	public String getIdOrigin() {
		return idOrigin;
	}

	public void setIdOrigin(String idOrigin) {
		this.idOrigin = idOrigin;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public void setComcontent(String comcontent) {
		this.comcontent = comcontent;
	}

	public String getComcontent() {
		return comcontent;
	}

	public void setCom_content(String comcontent) {
		this.comcontent = comcontent;
	}

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
