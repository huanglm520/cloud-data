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
}
