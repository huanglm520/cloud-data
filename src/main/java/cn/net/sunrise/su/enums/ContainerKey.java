package cn.net.sunrise.su.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape=JsonFormat.Shape.OBJECT)
public enum ContainerKey {

	OK(PassportKey.OK.code, PassportKey.OK.message),
	CONTAINER_NAME_EMPTY(-3001, "container name empty"),
	CONTAINER_NAME_TOO_LONG(-3002, "container name too long"),
	CONTAINER_NAME_NOT_ACCEPT(-3003, "container name not accept"),
	CONTAINER_NAME_ALREADY_EXISTS(-3004, "container name alerady exists"),
	API_NAME_EMPTY(-3005, "api name empty"),
	API_NAME_TOO_LONG(-3006, "api name too long"),
	API_NAME_NOT_ACCEPT(-3007, "api name not accept"),
	API_NAME_ALREADY_EXISTS(-3008, "api name already exists"),
	NO_PRIVILEGE(-3009, "no privilege"),
	ERROR_STATUS(-3010, "error status"),
	UNKNOWN_PRIVILEGE(-3011, "unknown privilege"),
	PRIVILEGE_ALREADY_EXISTS(-3012, "privilege already exists"),
	OWNER_NOT_ALLOW_DELETE(-3013, "owner not allow delete"),
	SERVER_EXCEPTION(PassportKey.SERVER_EXCEPTION.code, PassportKey.SERVER_EXCEPTION.message);
	
	public final int code;
	public final String message;
	private ContainerKey(int code, String message) {
		this.code = code;
		this.message = message;
	}
}
