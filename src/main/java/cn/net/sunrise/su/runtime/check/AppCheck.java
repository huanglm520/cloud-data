package cn.net.sunrise.su.runtime.check;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class AppCheck {
	
	@Value("${check.app.vercode}")
	private String vercode;
	@Value("${check.app.id}")
	private String id;
	
	private static AppCheck instance;
	
	private static Logger logger = LogManager.getLogger(AppCheck.class);
	
	@Autowired
	private void setAppCheck(AppCheck appCheck) {
		instance = appCheck;
	}
	
	public static boolean checkVercode(String vercode) {
		return vercode.matches(instance.vercode);
	}
	public static boolean checkId(String id) {
		return id.matches(instance.id);
	}
	private AppCheck() {
		logger.info("已初始化AppCheck工具");
	}
}
