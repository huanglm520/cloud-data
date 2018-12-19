package cn.net.sunrise.su.enums;

public enum SecurityKey {
	
	SECURITY_LOGIN_RECORD("securityloginrecord"),
	LOGIN_RECORD_START_TIME("loginrecordstarttime"),
	LOGIN_RECORD_END_TIME("loginrecordendtime"),
	CONTAINER_STATISTICS("containerstatistics"),
	CONTAINER_MANAGER_INFO("containermanagerinfo"),
	CONTAINER_MANAGER_PRIVILEGE("containermanagerprivilege"),
	CONTAINER_MANAGER_FIELD("containermanagerfield"),
	CONTAINER_NAME("containername"),
	SECURITY_CONTAINER_LIST("securitycontainerlist"),
	QUERY_SUCCESS("querysuccess");
	
	public final String key;
	
	private SecurityKey(String key) {
		this.key = key;
	}
}
