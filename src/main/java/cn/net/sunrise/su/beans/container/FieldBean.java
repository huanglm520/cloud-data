package cn.net.sunrise.su.beans.container;

import java.io.Serializable;

public class FieldBean implements Serializable {

	private static final long serialVersionUID = 415289649423849263L;
	
	private String Field;
	private String Type;
	private String Null;
	private String Key;
	private String Default;

	public FieldBean() {
		this.Default = "NULL";
	}
	public FieldBean(FieldBean fieldBean) {
		this.Field = fieldBean.getField();
		this.Type = fieldBean.getType();
		this.Null = fieldBean.getNull();
		this.Key = fieldBean.Key;
		this.Default = fieldBean.getDefault();
	}
	public String getField() {
		return Field;
	}
	public void setField(String field) {
		Field = field;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getNull() {
		return Null;
	}
	public void setNull(String null1) {
		Null = null1;
	}
	public String getKey() {
		return Key;
	}
	public void setKey(String key) {
		Key = key;
	}
	public String getDefault() {
		return Default;
	}
	public void setDefault(String default1) {
		Default = default1;
	}
}
