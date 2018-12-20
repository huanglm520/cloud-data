package cn.net.sunrise.su.tool;

import java.util.Properties;

public class FieldCheck {
	private static final Properties properties;
	static {
		properties = PropertiesLoader.loadProperties(FieldCheck.class, "/check/field-check.properties");
	}
	
	public static boolean checkFieldName(String name) {
		return name.matches(FieldCheck.properties.getProperty("fieldname"));
	}
	
	private FieldCheck() {
		throw new Error("No such object for class: FieldCheck");
	}
}
