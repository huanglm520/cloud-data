package cn.net.sunrise.su.beans;

import java.io.Serializable;

public class FieldBean extends BaseBean implements Serializable, Cloneable {

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
	public static final int NO = 2;
	
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
	
	@Override
	public FieldBean clone() {
		return (FieldBean) super.clone();
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cid;
		result = prime * result + ((defaultdata == null) ? 0 : defaultdata.hashCode());
		result = prime * result + id;
		result = prime * result + isnull;
		result = prime * result + key;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
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
		FieldBean other = (FieldBean) obj;
		if (cid != other.cid)
			return false;
		if (defaultdata == null) {
			if (other.defaultdata != null)
				return false;
		} else if (!defaultdata.equals(other.defaultdata))
			return false;
		if (id != other.id)
			return false;
		if (isnull != other.isnull)
			return false;
		if (key != other.key)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
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
	
	public static String textTypeString(String type, String length) {
		if (!type.matches("7|8")) {
			return type;
		}
		return type+"+"+length;
	}
	
	public void encode() {
		name = super.base64EncodeString(name);
		defaultdata = super.base64EncodeString(defaultdata);
	}
	public void decode() {
		name = super.base64DecodeString(name);
		defaultdata = super.base64DecodeString(defaultdata);
	}

	@Override
	public String toString() {
		return "FieldBean [id=" + id + ", cid=" + cid + ", name=" + name + ", type=" + type + ", isnull=" + isnull
				+ ", key=" + key + ", defaultdata=" + defaultdata + "]";
	}
	
	
}
