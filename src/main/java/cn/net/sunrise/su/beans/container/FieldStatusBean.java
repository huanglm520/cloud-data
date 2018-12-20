package cn.net.sunrise.su.beans.container;

import java.io.Serializable;

import cn.net.sunrise.su.enums.FieldKey;

public class FieldStatusBean implements Serializable {

	private static final long serialVersionUID = -2974398304036518432L;
	private int code;
	private String message;
	
	public FieldStatusBean() {
		
	}
	public FieldStatusBean(FieldKey fieldKey) {
		this.setCode(fieldKey.code);
		this.setMessage(fieldKey.message);
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
