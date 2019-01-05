package cn.net.sunrise.su.beans.container;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import cn.net.sunrise.su.enums.ContainerPrivilegeKey;
import cn.net.sunrise.su.enums.ContainerStatusKey;

public class ContainerBean implements Serializable {

	private static final long serialVersionUID = -7711511423288898873L;
	
	private int id;
	private int uid;
	private String name;
	private String api;
	private int status;
	private String state;
	private int field;
	private int data;
	private long buildtime;
	private int privilege;
	private String privileges;
	
	public ContainerBean() {
		this.id = -1;
		this.name = "";
		this.status = -1;
		this.privilege = -1;
	}
	
	public ContainerBean(ContainerBean containerBean) {
		this.id = containerBean.getId();
		this.uid = containerBean.getUid();
		this.name = containerBean.getName();
		this.api = containerBean.getApi();
		this.status = containerBean.getStatus();
		this.state = containerBean.getState();
		this.field = containerBean.getField();
		this.data = containerBean.getData();
		this.buildtime = containerBean.getBuildtime();
		this.privilege = containerBean.getPrivilege();
		this.privileges = containerBean.getPrivileges();
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getApi() {
		return api;
	}
	public void setApi(String api) {
		this.api = api;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getField() {
		return field;
	}
	public void setField(int field) {
		this.field = field;
	}
	public int getData() {
		return data;
	}
	public void setData(int data) {
		this.data = data;
	}
	public long getBuildtime() {
		return buildtime;
	}
	public void setBuildtime(long buildtime) {
		this.buildtime = buildtime;
	}
	public int getPrivilege() {
		return privilege;
	}
	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPrivileges() {
		return privileges;
	}
	public void setPrivileges(String privileges) {
		this.privileges = privileges;
	}
	
	public void privileges() {
		if (privilege == ContainerPrivilegeKey.ADMIN.key) {
			setPrivileges(ContainerPrivilegeKey.ADMIN.name);
		}
		if (privilege == ContainerPrivilegeKey.GUEST.key) {
			setPrivileges(ContainerPrivilegeKey.GUEST.name);
		}
		if (privilege == ContainerPrivilegeKey.OWNER.key) {
			setPrivileges(ContainerPrivilegeKey.OWNER.name);
		}
	}
	public void state() {
		if (status == ContainerStatusKey.CREATING.key) {
			setState(ContainerStatusKey.CREATING.name);
		}
		if (status == ContainerStatusKey.MODIFYING.key) {
			setState(ContainerStatusKey.MODIFYING.name);
		}
		if (status == ContainerStatusKey.RUNNING.key) {
			setState(ContainerStatusKey.RUNNING.name);
		}
		if (status == ContainerStatusKey.STOPING.key) {
			setState(ContainerStatusKey.STOPING.name);
		}
	}

	public String tableName() {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			return "zb_"+Base64.getEncoder().encodeToString(md5.digest((this.id+this.name).getBytes("GBK")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
