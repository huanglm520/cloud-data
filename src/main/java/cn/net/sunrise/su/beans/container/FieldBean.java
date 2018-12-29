package cn.net.sunrise.su.beans.container;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class FieldBean implements Serializable {

	private static final long serialVersionUID = 415289649423849263L;
	
	private int id;
	private int cid;
	private String name;
	private String type;
	private int isnull;
	private int key;
	private String defaultdata;
	
	public static final int ALLOW_NULL = 1;
	public static final int PROHIBIT_NULL = 0;
	
	public static final int PRI = 0;
	public static final int UNI = 1;
	
	public static final String NULL_DEFAULT = "NULL";
	
	public static final String BIT = "1";
	public static final String INT = "2";
	public static final String BIGINT = "3";
	public static final String FLOAT = "4";
	public static final String DOUBLE = "5";
	public static final String DECIMAL = "6";
	public static final String CHAR = "7";
	public static final String VARCHAR = "8";
	public static final String LONGTEXT = "9";
	
	public static final FieldBean DEFAULT_ID;
	static {
		DEFAULT_ID = new FieldBean();
		DEFAULT_ID.setId(-1);
		DEFAULT_ID.setName("id");
		DEFAULT_ID.setType(INT);
		DEFAULT_ID.setIsnull(PROHIBIT_NULL);
		DEFAULT_ID.setKey(PRI);
		DEFAULT_ID.setDefaultdata(NULL_DEFAULT);
	}
	
	public FieldBean() {
		this.defaultdata = NULL_DEFAULT;
	}
	
	public FieldBean(FieldBean fieldBean) {
		this.id = fieldBean.getId();
		this.cid = fieldBean.getCid();
		this.name = fieldBean.getName();
		this.type = fieldBean.getType();
		this.isnull = fieldBean.getIsnull();
		this.key = fieldBean.getKey();
		this.defaultdata = fieldBean.getDefaultdata();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getIsnull() {
		return isnull;
	}

	public void setIsnull(int isnull) {
		this.isnull = isnull;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getDefaultdata() {
		return defaultdata;
	}

	public void setDefaultdata(String defaultdata) {
		this.defaultdata = defaultdata;
	}
	
	public String textTypeString(String type, int length) {
		if (!type.matches("7|8|9")) {
			return type;
		}
		return type+"+"+length;
	}
	
	public void encode() {
		try {
			this.name = Base64.getEncoder().encodeToString(name.getBytes("GBK"));
			this.defaultdata = Base64.getEncoder().encodeToString(defaultdata.getBytes("GBK"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void decode() {
		try {
			this.name = new String(Base64.getDecoder().decode(name), "GBK");
			this.defaultdata = new String(Base64.getDecoder().decode(defaultdata), "GBK");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
