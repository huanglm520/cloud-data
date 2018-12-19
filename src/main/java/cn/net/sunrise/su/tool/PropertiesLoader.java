package cn.net.sunrise.su.tool;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;

// 此类适用于读取配置文件的工具类
public final class PropertiesLoader {
	
	public static final Properties loadProperties(Class<?> clazz, String propertiesFilePath) {
		Properties properties = new Properties();
		try {
			InputStreamReader isr = new InputStreamReader(clazz.getClassLoader().getResourceAsStream(propertiesFilePath),
				"UTF-8");
			properties.load(isr);
			isr.close();
		} catch (IOException | NullPointerException e) {
			LogManager.getLogger().error(e);
			throw new RuntimeException(e.getCause());
		}
		return properties;
	}
	
	private PropertiesLoader() {
		throw new Error("No such object for class: PropertiesLoader");
	}
}