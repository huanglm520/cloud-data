package cn.net.sunrise.su.beans;

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
	private int privilege;
	private String privileges;
	
	public ContainerPrivilegeBean() {
		
	}
	
	@Override
	public ContainerPrivilegeBean clone() {
		ContainerPrivilegeBean bean = new ContainerPrivilegeBean();
		bean.account = this.account;
		bean.cid = this.cid;
		bean.id = this.id;
		bean.name = this.name;
		bean.privilege = this.privilege;
		bean.privileges = this.privileges;
		bean.uid = this.uid;
		return bean;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((account == null) ? 0 : account.hashCode());
		result = prime * result + cid;
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + privilege;
		result = prime * result + ((privileges == null) ? 0 : privileges.hashCode());
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
		ContainerPrivilegeBean other = (ContainerPrivilegeBean) obj;
		if (account == null) {
			if (other.account != null)
				return false;
		} else if (!account.equals(other.account))
			return false;
		if (cid != other.cid)
			return false;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (privilege != other.privilege)
			return false;
		if (privileges == null) {
			if (other.privileges != null)
				return false;
		} else if (!privileges.equals(other.privileges))
			return false;
		if (uid != other.uid)
			return false;
		return true;
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
