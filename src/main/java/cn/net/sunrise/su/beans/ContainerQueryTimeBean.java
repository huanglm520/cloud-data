package cn.net.sunrise.su.beans;

import java.io.Serializable;

public class ContainerQueryTimeBean extends BaseBean implements Serializable, Cloneable {

	private static final long serialVersionUID = 8902943411751001105L;
	
	private int uid;
	private long leftTime;
	private long rightTime;
	
	public ContainerQueryTimeBean() {
		
	}

	@Override
	public ContainerQueryTimeBean clone() {
		ContainerQueryTimeBean bean = new ContainerQueryTimeBean();
		bean.uid = uid;
		bean.leftTime = leftTime;
		bean.rightTime = rightTime;
		return bean;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (leftTime ^ (leftTime >>> 32));
		result = prime * result + (int) (rightTime ^ (rightTime >>> 32));
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
		ContainerQueryTimeBean other = (ContainerQueryTimeBean) obj;
		if (leftTime != other.leftTime)
			return false;
		if (rightTime != other.rightTime)
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

	public long getLeftTime() {
		return leftTime;
	}

	public void setLeftTime(long leftTime) {
		this.leftTime = leftTime;
	}

	public long getRightTime() {
		return rightTime;
	}

	public void setRightTime(long rightTime) {
		this.rightTime = rightTime;
	}
	
}
