package cn.net.sunrise.su.runtime.check;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class FieldCheck {
	
	@Value("${check.field.name}")
	private String name;
	
	private static FieldCheck instance;
	
	private static Logger logger = LogManager.getLogger(FieldCheck.class);
	
	@Autowired
	private void setFieldCheck(FieldCheck fieldCheck) {
		instance = fieldCheck;
	}
	
	public static boolean checkFieldName(String name) {
		return name.matches(instance.name);
	}
	
	private FieldCheck() {
		logger.info("已初始化FieldCheck工具");
	}
}
