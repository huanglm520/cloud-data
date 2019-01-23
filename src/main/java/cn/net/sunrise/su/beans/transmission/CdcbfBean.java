package cn.net.sunrise.su.beans.transmission;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.FieldBean;

public class CdcbfBean implements Serializable {

	private static final long serialVersionUID = -3604283780254366362L;
	public static final String OWNER = "owner";
	public static final String ADMIN = "admin";
	public static final String GUEST = "guest";

	private ContainerBean containerBean = null;
	private List<FieldBean> fieldBeans = new ArrayList<>();
	private List<Map<String, Object> > datas = new ArrayList<>();
	private Map<String, List<String> > privileges = new HashMap<>();
	public List<FieldBean> getFieldBeans() {
		return fieldBeans;
	}
	public void setFieldBeans(List<FieldBean> fieldBeans) {
		this.fieldBeans = fieldBeans;
	}
	public List<Map<String, Object>> getDatas() {
		return datas;
	}
	public void setDatas(List<Map<String, Object>> datas) {
		this.datas = datas;
	}
	public Map<String, List<String>> getPrivileges() {
		return privileges;
	}
	public void setPrivileges(Map<String, List<String>> privileges) {
		this.privileges = privileges;
	}
	public void addField(FieldBean fieldBean) {
		fieldBeans.add(fieldBean);
	}
	public void addData(Map<String, Object> data) {
		datas.add(data);
	}
	public void addPrivilege(String key, String value) {
		List<String> list = privileges.get(key);
		if (list == null) {
			list = new ArrayList<>();
			privileges.put(key, list);
		}
		list.add(value);
	}
	public ContainerBean getContainerBean() {
		return containerBean;
	}
	public void setContainerBean(ContainerBean containerBean) {
		this.containerBean = containerBean;
	}
}
