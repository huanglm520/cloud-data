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
