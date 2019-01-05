package cn.net.sunrise.su.tool;

import java.util.Properties;

public class AppCheck {
	
	private static final Properties properties;
	static {
		properties = PropertiesLoader.loadProperties(AppCheck.class, "/check/app-check.properties");
	}
	
	public static boolean checkVercode(String vercode) {
		return vercode.matches(AppCheck.properties.getProperty("vercode"));
	}
	public static boolean checkId(String id) {
		return id.matches(AppCheck.properties.getProperty("id"));
	}
	private AppCheck() {
		throw new Error("No such object for class: AppCheck");
	}
}
