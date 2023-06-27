package recipe.model;

public class RecipeReviewReportBean {
	private int rerepnum;
	private String reportcontent; //신고내용
	private int reviewnum;
	private String reportreason; //신고이유
	private String id;
	private String idorigin;
	private String count;
	private String review; // 상세보기용
	private int report;
	
	
	public String getIdorigin() {
		return idorigin;
	}
	public void setIdorigin(String idorigin) {
		this.idorigin = idorigin;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReportreason() {
		return reportreason;
	}
	public void setReportreason(String reportreason) {
		this.reportreason = reportreason;
	}
	public int getRerepnum() {
		return rerepnum;
	}
	public void setRerepnum(int rerepnum) {
		this.rerepnum = rerepnum;
	}
	public String getReportcontent() {
		return reportcontent;
	}
	public void setReportcontent(String reportcontent) {
		this.reportcontent = reportcontent;
	}
	public int getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}
	
	
}
