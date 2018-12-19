package cn.net.sunrise.su.beans.container;

import java.io.Serializable;

public class ContainerNewBean implements Serializable {

	private static final long serialVersionUID = -6640052201196273723L;
	
	private String tablename;
	
	public ContainerNewBean() {}
	public ContainerNewBean(String tableName) {
		this.tablename = tableName;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

}
