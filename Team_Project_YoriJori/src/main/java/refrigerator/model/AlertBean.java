package refrigerator.model;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMethod;

public class AlertBean {
	private String msg;              //alert 메시지
    private String url;          	 //redirect url
    private RequestMethod method;   	 //HTTP 요청 메서드
    private Map<String, Object> data;    //param 데이터
    
	public AlertBean(String msg, String url, RequestMethod method, Map<String, Object> data) {
		super();
		this.msg = msg;
		this.url = url;
		this.method = method;
		this.data = data;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public RequestMethod getMethod() {
		return method;
	}
	public void setMethod(RequestMethod method) {
		this.method = method;
	}
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
    
    
}
