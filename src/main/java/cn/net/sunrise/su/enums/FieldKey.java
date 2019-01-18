package cn.net.sunrise.su.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape=JsonFormat.Shape.OBJECT)
public enum FieldKey {

	OK(PassportKey.OK.code, PassportKey.OK.message),
	FIELD_NAME_EMPTY(-2001, "field name empty"),
	FIELD_NAME_NOT_ACCEPT(-2002, "field name not accept"),
	FIELD_NAME_ALREADY_EXISTS(-2003, "field name already exists"),
	SERVER_EXCEPTION(PassportKey.SERVER_EXCEPTION.code, PassportKey.SERVER_EXCEPTION.message);
	
	public final int code;
	public final String message;
	private FieldKey(int code, String message) {
		this.code = code;
		this.message = message;
	}
}
