package cn.net.sunrise.su.beans.passport;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class UserBean implements Serializable {
	private static final long serialVersionUID = -3624888688567846222L;
	private int id;
	private String account;
	private transient String password;
	private long regtime;
	private String first_name;
	private String last_name;
	private String company;
	private transient String salt;
	
	public UserBean() {
		
	}
	
	@Override
	public UserBean clone() {
		UserBean bean = new UserBean();
		bean.account = this.account;
		bean.company = this.company;
		bean.first_name = this.first_name;
		bean.id = this.id;
		bean.last_name = this.last_name;
		bean.password = this.password;
		bean.regtime = this.regtime;
		bean.salt = this.salt;
		return bean;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((account == null) ? 0 : account.hashCode());
		result = prime * result + ((company == null) ? 0 : company.hashCode());
		result = prime * result + ((first_name == null) ? 0 : first_name.hashCode());
		result = prime * result + id;
		result = prime * result + ((last_name == null) ? 0 : last_name.hashCode());
		result = prime * result + (int) (regtime ^ (regtime >>> 32));
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
		UserBean other = (UserBean) obj;
		if (account == null) {
			if (other.account != null)
				return false;
		} else if (!account.equals(other.account))
			return false;
		if (company == null) {
			if (other.company != null)
				return false;
		} else if (!company.equals(other.company))
			return false;
		if (first_name == null) {
			if (other.first_name != null)
				return false;
		} else if (!first_name.equals(other.first_name))
			return false;
		if (id != other.id)
			return false;
		if (last_name == null) {
			if (other.last_name != null)
				return false;
		} else if (!last_name.equals(other.last_name))
			return false;
		if (regtime != other.regtime)
			return false;
		return true;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getRegtime() {
		return regtime;
	}

	public void setRegtime(long regtime) {
		this.regtime = regtime;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getSalt() {
		return salt;
	}
	
	public void setSalt(String salt) {
		this.salt = salt;
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

	public void encode() {
		try {
			this.first_name = this.first_name==null ? null : Base64.getEncoder().encodeToString(this.first_name.getBytes("GBK"));
			this.last_name = this.last_name==null ? null : Base64.getEncoder().encodeToString(this.last_name.getBytes("GBK"));
			this.company = this.company==null ? null : Base64.getEncoder().encodeToString(this.company.getBytes("GBK"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public void decode() {
		try {
			this.first_name = this.first_name==null ? null : new String(Base64.getDecoder().decode(this.first_name), "GBK");
			this.last_name = this.last_name==null ? null : new String(Base64.getDecoder().decode(this.last_name), "GBK");
			this.company = this.company==null ? null : new String(Base64.getDecoder().decode(this.company), "GBK");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public void encodePassword() {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			MessageDigest sha1 = MessageDigest.getInstance("SHA-1");
			String p = Base64.getEncoder().encodeToString(md5.digest(this.password.getBytes("GBK")));
			String s = Base64.getEncoder().encodeToString(md5.digest(this.salt.getBytes("GBK")));
			this.password = Base64.getEncoder().encodeToString(sha1.digest((p+s).getBytes("GBK")));
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
