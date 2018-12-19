package cn.net.sunrise.su.beans.passport;

import java.io.Serializable;

public class LoginRecordTimeBean implements Serializable {
	private static final long serialVersionUID = 1626381556118936173L;
	private int uid;
	private long sTime;
	private long eTime;
	private int left;
	private int right;
	
	public LoginRecordTimeBean() {
		// Empty
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public long getsTime() {
		return sTime;
	}

	public void setsTime(long sTime) {
		this.sTime = sTime;
	}

	public long geteTime() {
		return eTime;
	}

	public void seteTime(long eTime) {
		this.eTime = eTime;
	}
	
	public int getLeft() {
		return left;
	}
	
	public void setLeft(int left) {
		this.left = left;
	}
	
	public int getRight() {
		return right;
	}
	
	public void setRight(int right) {
		this.right = right;
	}
}
