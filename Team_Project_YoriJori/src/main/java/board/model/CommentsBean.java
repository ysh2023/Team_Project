package board.model;

public class CommentsBean {
	private int com_num;
	private String com_content;
	private int ref;
	private int refStep;
	private int refLevel;
	private int bodNum;

	public int getCom_num() {
		return com_num;
	}

	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRefStep() {
		return refStep;
	}

	public void setRefStep(int refStep) {
		this.refStep = refStep;
	}

	public int getRefLevel() {
		return refLevel;
	}

	public void setRefLevel(int refLevel) {
		this.refLevel = refLevel;
	}

	public int getBodNum() {
		return bodNum;
	}

	public void setBodNum(int bodNum) {
		this.bodNum = bodNum;
	}

}
