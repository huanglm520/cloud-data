package cn.net.sunrise.su.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape=JsonFormat.Shape.OBJECT)
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
	
	public static final String privilegeName(int key) {
		if (key == OWNER.key) {
			return OWNER.name;
		}
		else if (key == ADMIN.key) {
			return ADMIN.name;
		}
		else if (key == GUEST.key) {
			return GUEST.name;
		}
		throw new RuntimeException("Unsupport ContainerPrivilege Key");
	}
}
