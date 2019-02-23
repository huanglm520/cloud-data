package cn.net.sunrise.su.beans;

import java.io.Serializable;

public class ContainerNewBean implements Serializable {

	private static final long serialVersionUID = -6640052201196273723L;
	
	private String tablename;
	
	public ContainerNewBean() {
		
	}
	
	public ContainerNewBean(String tableName) {
		this.tablename = tableName;
	}

	@Override
	public ContainerNewBean clone() {
		ContainerNewBean bean = new ContainerNewBean();
		bean.tablename = this.tablename;
		return bean;
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((tablename == null) ? 0 : tablename.hashCode());
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
		ContainerNewBean other = (ContainerNewBean) obj;
		if (tablename == null) {
			if (other.tablename != null)
				return false;
		} else if (!tablename.equals(other.tablename))
			return false;
		return true;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

}
