package cn.net.sunrise.su.enums;

public enum ContainerStatusKey {

	RUNNING(1, "运行中"),
	STOPING(2, "已停用"),
	MODIFYING(3, "修改中"),
	CREATING(4, "创建中");
	
	public final int key;
	public final String name;
	private ContainerStatusKey(int key, String name) {
		this.key = key;
		this.name = name;
	}
	public static final String statusName(int key) {
		if (key == RUNNING.key) {
			return RUNNING.name;
		}
		else if (key == STOPING.key) {
			return STOPING.name;
		}
		else if (key == MODIFYING.key) {
			return MODIFYING.name;
		}
		else if (key == CREATING.key) {
			return CREATING.name;
		}
		throw new RuntimeException("Unsupport ContainerStatus Key");
	}
}
