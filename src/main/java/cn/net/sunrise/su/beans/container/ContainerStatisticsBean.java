package cn.net.sunrise.su.beans.container;

import java.io.Serializable;

import cn.net.sunrise.su.enums.ContainerStatusKey;

public class ContainerStatisticsBean implements Serializable {
	
	private static final long serialVersionUID = 7350061263158691205L;
	
	private int value;
	private int status;
	@SuppressWarnings("unused")
	private String name;
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public void getName() {
		if (status == ContainerStatusKey.CREATING.key) {
			name = ContainerStatusKey.CREATING.name;
		}
		if (status == ContainerStatusKey.MODIFYING.key) {
			name = ContainerStatusKey.MODIFYING.name;
		}
		if (status == ContainerStatusKey.RUNNING.key) {
			name = ContainerStatusKey.RUNNING.name;
		}
		if (status == ContainerStatusKey.STOPING.key) {
			name = ContainerStatusKey.STOPING.name;
		}
	}
}
