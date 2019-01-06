package cn.net.sunrise.su.beans.passport;

import java.io.Serializable;

import cn.net.sunrise.su.enums.PassportKey;

/*
 * 登录状态返回值封装实体类
 * author: Sunrise(Huang Liming)
 */

public class PassportStatusBean implements Serializable {
	private static final long serialVersionUID = -2652762703952330488L;
	// 实体类数据
	private int code;
	private String message;
	
	// 带参构造器
	public PassportStatusBean(int code, String message) {
		this.code = code;
		this.message = message;
	}
	public PassportStatusBean(PassportKey passportKey) {
		this(passportKey.code, passportKey.message);
	}
	// 默认构造器
	public PassportStatusBean() {
		// Empty
	}
	
	@Override
	public PassportStatusBean clone() {
		PassportStatusBean bean = new PassportStatusBean();
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
		PassportStatusBean other = (PassportStatusBean) obj;
		if (code != other.code)
			return false;
		if (message == null) {
			if (other.message != null)
				return false;
		} else if (!message.equals(other.message))
			return false;
		return true;
	}
	// 设置Get和Set接口	
	public void setCode(int code) {
		this.code = code;
	}
	public int getCode() {
		return this.code;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	public String getMessage() {
		return this.message;
	}
} 
