package cn.net.sunrise.su.beans;

import java.io.Serializable;

public class LoginRecordStatisticsBean extends BaseBean implements Serializable {
	private static final long serialVersionUID = 1090214364073320991L;
	private long value;
	private String name;
	
	public LoginRecordStatisticsBean() {
		
	}
	
	@Override
	public LoginRecordStatisticsBean clone() {
		LoginRecordStatisticsBean bean = new LoginRecordStatisticsBean();
		bean.name = this.name;
		bean.value = this.value;
		return bean;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + (int) (value ^ (value >>> 32));
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
		LoginRecordStatisticsBean other = (LoginRecordStatisticsBean) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (value != other.value)
			return false;
		return true;
	}

	public long getValue() {
		return value;
	}
	public void setValue(long total) {
		this.value = total;
	}
	public String getPosition() {
		return name;
	}
	public void setPosition(String position) {
		this.name = position;
	}
	public void decode() {
		name = BaseBean.base64DecodeString(name);
	}
}
