package shopmemo.model;

import org.hibernate.validator.constraints.NotBlank;

public class MemoBean {
	private int memonum;
	private String id;
	
	private String memotask;
	
	private int memoflag;
	private String memocontent;
	
	public int getMemonum() {
		return memonum;
	}
	public void setMemonum(int memonum) {
		this.memonum = memonum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMemotask() {
		return memotask;
	}
	public void setMemotask(String memotask) {
		this.memotask = memotask;
	}
	public int getMemoflag() {
		return memoflag;
	}
	public void setMemoflag(int memoflag) {
		this.memoflag = memoflag;
	}
	public String getMemocontent() {
		return memocontent;
	}
	public void setMemocontent(String memocontent) {
		this.memocontent = memocontent;
	}
}
