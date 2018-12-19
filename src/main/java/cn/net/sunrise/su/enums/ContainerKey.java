package cn.net.sunrise.su.enums;

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
	SERVER_EXCEPTION(PassportKey.SERVER_EXCEPTION.code, PassportKey.SERVER_EXCEPTION.message);
	
	public final int code;
	public final String message;
	private ContainerKey(int code, String message) {
		this.code = code;
		this.message = message;
	}
}
