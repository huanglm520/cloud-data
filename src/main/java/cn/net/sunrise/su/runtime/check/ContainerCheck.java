package cn.net.sunrise.su.runtime.check;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ContainerCheck {

	@Value("${check.container.name}")
	private String name;
	@Value("${check.container.api}")
	private String api;
	
	private static ContainerCheck instance;
	
	private static Logger logger = LogManager.getLogger(ContainerCheck.class);
	
	@Autowired
	private void setContainerCheck(ContainerCheck containerCheck) {
		instance = containerCheck;
	}
	
	public static boolean checkContainerName(String name) {
		return name.matches(instance.name);
	}
	
	public static boolean checkApiName(String name) {
		return name.matches(instance.api);
	}
	
	private ContainerCheck() {
		logger.info("已初始化ContainerCheck工具");
	}
}
