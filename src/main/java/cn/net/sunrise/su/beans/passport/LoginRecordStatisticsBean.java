package cn.net.sunrise.su.beans.passport;

import java.io.Serializable;
import java.util.Base64;

public class LoginRecordStatisticsBean implements Serializable {
	private static final long serialVersionUID = 1090214364073320991L;
	private long value;
	private String name;
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
		this.name = this.name==null ? null : new String(Base64.getDecoder().decode(this.name));
	}
}
