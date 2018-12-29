package cn.net.sunrise.su.beans.container;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.Base64;

import cn.net.sunrise.su.enums.ContainerPrivilegeKey;

public class ContainerPrivilegeBean implements Serializable {

	private static final long serialVersionUID = 1499101471082582896L;
	
	private int id;
	private int uid;
	private String account;
	private String name;
	private int cid;
	private transient int privilege;
	private String privileges;
	
	public ContainerPrivilegeBean() {
		
	}
	
	public ContainerPrivilegeBean(ContainerPrivilegeBean containerPrivilegeBean) {
		this.id = containerPrivilegeBean.getId();
		this.uid = containerPrivilegeBean.getUid();
		this.account = containerPrivilegeBean.getAccount();
		this.name = containerPrivilegeBean.getName();
		this.cid = containerPrivilegeBean.getCid();
		this.privilege = containerPrivilegeBean.getPrivilege();
		this.privileges = containerPrivilegeBean.getPrivileges();
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
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getPrivilege() {
		return privilege;
	}
	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}
	
	public String getPrivileges() {
		return privileges;
	}
	public void setPrivileges(String privileges) {
		this.privileges = privileges;
	}
	
	public void encodeAccount() {
		try {
			this.account = this.account==null ? null : Base64.getEncoder().encodeToString(this.account.getBytes("GBK"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void decodeAccount() {
		try {
			this.account = this.account==null ? null : new String(Base64.getDecoder().decode(this.account), "GBK");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void privileges() {
		if (privilege == ContainerPrivilegeKey.OWNER.key) {
			privileges = ContainerPrivilegeKey.OWNER.name;
		}
		if (privilege == ContainerPrivilegeKey.ADMIN.key) {
			privileges = ContainerPrivilegeKey.ADMIN.name;
		}
		if (privilege == ContainerPrivilegeKey.GUEST.key) {
			privileges = ContainerPrivilegeKey.GUEST.name;
		}
	}

}
