package cn.net.sunrise.su.tool;

import java.util.Properties;

public class UserCheck {
	private static final Properties properties;
	static {
		properties = PropertiesLoader.loadProperties(UserCheck.class, "/check/user-check.properties");
	}
	
	public static boolean checkAccount(String account) {
		return account.matches(UserCheck.properties.getProperty("account"));
	}
	
	public static boolean checkPassword(String password) {
		return password.matches(UserCheck.properties.getProperty("password"));
	}
	
	public static boolean checkFirst_Name(String name) {
		return name.matches(UserCheck.properties.getProperty("firstname"));
	}
	
	public static boolean checkLast_name(String name) {
		return name.matches(UserCheck.properties.getProperty("lastname"));
	}
	
	public static boolean checkCompany(String company) {
		return company.matches(UserCheck.properties.getProperty("company"));
	}
	
	private UserCheck() {
		throw new Error("No such object for class: UserCheck");
	}
}
