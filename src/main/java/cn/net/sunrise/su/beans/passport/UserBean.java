package cn.net.sunrise.su.beans.passport;

import java.io.Serializable;
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
	
	public UserBean() {}
	
	public UserBean(UserBean usb) {
		this.id = usb.getId();
		this.account = usb.getAccount();
		this.password = usb.getPassword();
		this.regtime = usb.getRegtime();
		this.first_name = usb.getFirst_name();
		this.last_name = usb.getLast_name();
		this.company = usb.getCompany();
		this.salt = usb.getSalt();
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
		this.account = this.account==null ? null : Base64.getEncoder().encodeToString(this.account.getBytes());
	}
	
	public void decodeAccount() {
		this.account = this.account==null ? null : new String(Base64.getDecoder().decode(this.account));
	}

	public void encode() {
		this.first_name = this.first_name==null ? null : Base64.getEncoder().encodeToString(this.first_name.getBytes());
		this.last_name = this.last_name==null ? null : Base64.getEncoder().encodeToString(this.last_name.getBytes());
		this.company = this.company==null ? null : Base64.getEncoder().encodeToString(this.company.getBytes());
	}
	
	public void decode() {
		this.first_name = this.first_name==null ? null : new String(Base64.getDecoder().decode(this.first_name));
		this.last_name = this.last_name==null ? null : new String(Base64.getDecoder().decode(this.last_name));
		this.company = this.company==null ? null : new String(Base64.getDecoder().decode(this.company));
	}
	
	public void encodePassword() {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			MessageDigest sha1 = MessageDigest.getInstance("SHA-1");
			String p = Base64.getEncoder().encodeToString(md5.digest(this.password.getBytes()));
			String s = Base64.getEncoder().encodeToString(md5.digest(this.salt.getBytes()));
			this.password = Base64.getEncoder().encodeToString(sha1.digest((p+s).getBytes()));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
