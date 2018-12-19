package cn.net.sunrise.su.enums;

public enum ContainerPrivilegeKey {
	
	OWNER(1, "OWNER"),
	ADMIN(2, "ADMIN"),
	GUEST(3, "GUEST");
	
	public final int key;
	public final String name;
	private ContainerPrivilegeKey(int key, String name) {
		this.key = key;
		this.name = name;
	}
}
