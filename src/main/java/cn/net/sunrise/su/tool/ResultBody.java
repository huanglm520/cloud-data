package cn.net.sunrise.su.tool;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import cn.net.sunrise.su.beans.container.ContainerStatusBean;
import cn.net.sunrise.su.beans.container.FieldStatusBean;
import cn.net.sunrise.su.beans.passport.PassportStatusBean;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.FieldKey;
import cn.net.sunrise.su.enums.PassportKey;

public final class ResultBody {
	
	private static Gson gson;
	private static Map<Object, Object> map;
	static {
		gson = new Gson();
		map = new HashMap<>();
	}

	public static final String result(Object obj) {
		if ((obj instanceof PassportKey) || (obj instanceof ContainerKey) || (obj instanceof FieldKey)) {
			Object object = map.get(obj);
			if (object == null) {
				if (obj instanceof PassportKey) {
					object = new PassportStatusBean((PassportKey)obj);
					map.put(obj, object);
				} else if (obj instanceof ContainerKey) {
					object = new ContainerStatusBean((ContainerKey)obj);
					map.put(obj, object);
				} else if (obj instanceof FieldKey) {
					object = new FieldStatusBean((FieldKey)obj);
					map.put(obj, object);
				}
			}
			return gson.toJson(object);
		}
		if ((obj instanceof PassportStatusBean) || (obj instanceof ContainerStatusBean) || (obj instanceof FieldStatusBean)) {
			return gson.toJson(obj);
		}
		throw new RuntimeException("Unknown OR Unsupport object type.");
	}
}
