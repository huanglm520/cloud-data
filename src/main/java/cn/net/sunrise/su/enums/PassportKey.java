package cn.net.sunrise.su.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape=JsonFormat.Shape.OBJECT)
public enum PassportKey {

	OK(0, "ok"),
	ACCOUNT_NOT_EXISTS(-4001, "account not exists"),
	PASSWORD_WRONG(-4002, "password is wrong"),
	ACCOUNT_NOT_ACCEPT(-4003, "account not accept"),
	PASSWORD_NOT_ACCEPT(-4004, "password not accept"),
	ACCOUNT_ALREADY_EXISTS(-4005, "account already exists"),
	FIRST_NAME_NOT_ACCEPT(-4006, "first name not accept"),
	LAST_NAME_NOT_ACCEPT(-4007, "last name not accept"),
	COMPANY_NOT_ACCEPT(-4008, "company not accept"),
	ACCOUNT_EMPTY(-4009, "account is empty"),
	PASSWORD_EMPTY(-4010, "password is empty"),
	VERCODE_EMPTY(-4011, "vercode is empty"),
	VERCODE_NOT_ACCEPT(-4012, "vercode not accept"),
	VERCODE_WRONG(-4013, "vercode is wrong"),
	INCOMPLETE_INFORMATION(-4014, "incomplete information"),
	NOT_LOGIN(-4015, "not login"),
	SERVER_EXCEPTION(-5001, "server exception");
	
	public final int code;
	public final String message;
	
	private PassportKey(int code, String message) {
		this.code = code;
		this.message = message;
	}
}
