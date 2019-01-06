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
	
	@Override
	public FieldStatusBean clone() {
		FieldStatusBean bean = new FieldStatusBean();
		bean.code = this.code;
		bean.message = this.message;
		return bean;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		FieldStatusBean other = (FieldStatusBean) obj;
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
	
}
