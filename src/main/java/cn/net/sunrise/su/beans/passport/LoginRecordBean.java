package cn.net.sunrise.su.beans.passport;

import java.io.Serializable;
import java.util.Base64;

import cn.net.sunrise.su.tool.IpTool;

public class LoginRecordBean implements Serializable {
	private static final long serialVersionUID = 7505514924544960068L;
	private int id;
	private int uid;
	private String address;
	private long time;
	private String position;
	
	public LoginRecordBean() {
		// Empty
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}
	
	public String getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position = position;
	}
	
	public void encryptIpAddress() {
		this.address = IpTool.IpAnonymous(this.address);
	}
	
	public void encode() {
		this.address = this.address==null ? null : Base64.getEncoder().encodeToString(this.address.getBytes());
		this.position = this.position==null ? null : Base64.getEncoder().encodeToString(this.position.getBytes());
	}
	
	public void decode() {
		this.address = this.address==null ? null : new String(Base64.getDecoder().decode(this.address));
		this.position = this.position==null ? null : new String(Base64.getDecoder().decode(this.position));
	}
	
}
