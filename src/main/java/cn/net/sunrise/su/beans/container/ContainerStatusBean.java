package cn.net.sunrise.su.beans.container;

import java.io.Serializable;

import cn.net.sunrise.su.enums.ContainerKey;

public class ContainerStatusBean implements Serializable {

	private static final long serialVersionUID = -459754938177650810L;
	
	private int code;
	private String message;
	private int cid;
	public ContainerStatusBean() {
		
	}
	public ContainerStatusBean(int code, String message) {
		this(code, message, -1);
	}
	public ContainerStatusBean(ContainerKey containerKey) {
		this(containerKey.code, containerKey.message);
	}
	public ContainerStatusBean(int code, String message, int cid) {
		this.code = code;
		this.message = message;
		this.cid = cid;
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
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
}
