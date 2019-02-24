package cn.net.sunrise.su.beans;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import cn.net.sunrise.su.enums.ContainerPrivilegeKey;
import cn.net.sunrise.su.enums.ContainerStatusKey;

public class ContainerBean extends BaseBean implements Serializable, Cloneable {

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
	private int locked;
	
	public ContainerBean() {
		this.id = -1;
		this.name = "";
		this.status = -1;
		this.privilege = -1;
	}
	
	@Override
	public ContainerBean clone() {
		ContainerBean bean = new ContainerBean();
		bean.api = this.api;
		bean.buildtime = this.buildtime;
		bean.data = this.data;
		bean.field = this.field;
		bean.id = this.id;
		bean.name = this.name;
		bean.privilege = this.privilege;
		bean.privileges = this.privileges;
		bean.state = this.state;
		bean.status = this.status;
		bean.uid = this.uid;
		bean.locked = this.locked;
		return bean;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((api == null) ? 0 : api.hashCode());
		result = prime * result + (int) (buildtime ^ (buildtime >>> 32));
		result = prime * result + data;
		result = prime * result + field;
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + privilege;
		result = prime * result + ((privileges == null) ? 0 : privileges.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + status;
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
		ContainerBean other = (ContainerBean) obj;
		if (api == null) {
			if (other.api != null)
				return false;
		} else if (!api.equals(other.api))
			return false;
		if (buildtime != other.buildtime)
			return false;
		if (data != other.data)
			return false;
		if (field != other.field)
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
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (status != other.status)
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
		privileges = ContainerPrivilegeKey.privilegeName(privilege);
	}
	public void state() {
		state = ContainerStatusKey.statusName(status);
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

	public int getLocked() {
		return locked;
	}

	public void setLocked(int locked) {
		this.locked = locked;
	}
}
