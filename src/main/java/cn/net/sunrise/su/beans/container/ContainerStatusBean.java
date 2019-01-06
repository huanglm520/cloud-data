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
	
	@Override
	public ContainerStatusBean clone() {
		ContainerStatusBean bean = new ContainerStatusBean();
		bean.cid = this.cid;
		bean.message = this.message;
		bean.code = this.code;
		return bean;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cid;
		result = prime * result + code;
		result = prime * result + ((message == null) ? 0 : message.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ContainerStatusBean other = (ContainerStatusBean) obj;
		if (cid != other.cid)
			return false;
		if (code != other.code)
			return false;
		if (message == null) {
			if (other.message != null)
				return false;
		} else if (!message.equals(other.message))
			return false;
		return true;
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
