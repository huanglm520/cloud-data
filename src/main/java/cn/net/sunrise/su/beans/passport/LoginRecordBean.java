package cn.net.sunrise.su.beans.passport;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
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
	
	@Override
	public LoginRecordBean clone() {
		LoginRecordBean bean = new LoginRecordBean();
		bean.address = this.address;
		bean.id = this.id;
		bean.position = this.position;
		bean.time = this.time;
		bean.uid = this.uid;
		return bean;
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + id;
		result = prime * result + ((position == null) ? 0 : position.hashCode());
		result = prime * result + (int) (time ^ (time >>> 32));
		result = prime * result + uid;
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
		LoginRecordBean other = (LoginRecordBean) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (id != other.id)
			return false;
		if (position == null) {
			if (other.position != null)
				return false;
		} else if (!position.equals(other.position))
			return false;
		if (time != other.time)
			return false;
		if (uid != other.uid)
			return false;
		return true;
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
		try {
			this.address = this.address==null ? null : Base64.getEncoder().encodeToString(this.address.getBytes("GBK"));
			this.position = this.position==null ? null : Base64.getEncoder().encodeToString(this.position.getBytes("GBK"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void decode() {
		try {
			this.address = this.address==null ? null : new String(Base64.getDecoder().decode(this.address), "GBK");
			this.position = this.position==null ? null : new String(Base64.getDecoder().decode(this.position),"GBK");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
