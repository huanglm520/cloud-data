package cn.net.sunrise.su.beans;

import java.io.Serializable;

public class LoginRecordTimeBean extends BaseBean implements Serializable {
	private static final long serialVersionUID = 1626381556118936173L;
	private int uid;
	private long sTime;
	private long eTime;
	private int left;
	private int right;
	
	public LoginRecordTimeBean() {
		// Empty
	}
	
	@Override
	public LoginRecordTimeBean clone() {
		LoginRecordTimeBean bean = new LoginRecordTimeBean();
		bean.eTime = this.eTime;
		bean.left = this.left;
		bean.right = this.right;
		bean.sTime = this.sTime;
		bean.uid = this.uid;
		return bean;
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (eTime ^ (eTime >>> 32));
		result = prime * result + left;
		result = prime * result + right;
		result = prime * result + (int) (sTime ^ (sTime >>> 32));
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
		LoginRecordTimeBean other = (LoginRecordTimeBean) obj;
		if (eTime != other.eTime)
			return false;
		if (left != other.left)
			return false;
		if (right != other.right)
			return false;
		if (sTime != other.sTime)
			return false;
		if (uid != other.uid)
			return false;
		return true;
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
