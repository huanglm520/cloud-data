package cn.net.sunrise.su.runtime.check;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class UserCheck {
	
	@Value("${check.user.account}")
	private String account;
	@Value("${check.user.password}")
	private String password;
	@Value("${check.user.firstname}")
	private String firstname;
	@Value("${check.user.lastname}")
	private String lastname;
	@Value("${check.user.company}")
	private String company;
	
	private static UserCheck instance;
	
	private static Logger logger = LogManager.getLogger(UserCheck.class);
	
	@Autowired
	private void setUserCheck(UserCheck userCheck) {
		instance = userCheck;
	}
	
	public static boolean checkAccount(String account) {
		return account.matches(instance.account);
	}
	
	public static boolean checkPassword(String password) {
		return password.matches(instance.password);
	}
	
	public static boolean checkFirstName(String name) {
		return name.matches(instance.firstname);
	}
	
	public static boolean checkLastName(String name) {
		return name.matches(instance.lastname);
	}
	
	public static boolean checkCompany(String company) {
		return company.matches(instance.company);
	}
	
	private UserCheck() {
		logger.info("已初始化UserCheck工具");
	}
}
