package cn.net.sunrise.su.tool;

import java.util.Properties;

public class ContainerCheck {

	private static final Properties properties;
	static {
		properties = PropertiesLoader.loadProperties(ContainerCheck.class, "/check/container-check.properties");
	}
	
	public static boolean checkContainerName(String name) {
		return name.matches(ContainerCheck.properties.getProperty("containername"));
	}
	
	public static boolean checkApiName(String name) {
		return name.matches(ContainerCheck.properties.getProperty("apiname"));
	}
	
	private ContainerCheck() {
		throw new Error("No such object for class: ContainerCheck");
	}
}
