package cn.net.sunrise.su.beans.container;

import java.io.Serializable;

import cn.net.sunrise.su.enums.ContainerStatusKey;

public class ContainerStatisticsBean implements Serializable {
	
	private static final long serialVersionUID = 7350061263158691205L;
	
	private int value;
	private int status;
	private String name;
	
	public ContainerStatisticsBean() {
		
	}
	
	@Override
	public ContainerStatisticsBean clone() {
		ContainerStatisticsBean bean = new ContainerStatisticsBean();
		bean.name = this.name;
		bean.status = this.status;
		bean.value = this.value;
		return bean;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + status;
		result = prime * result + value;
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
		ContainerStatisticsBean other = (ContainerStatisticsBean) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (status != other.status)
			return false;
		if (value != other.value)
			return false;
		return true;
	}

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
