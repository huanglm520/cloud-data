package cn.net.sunrise.su.tool;

import com.google.gson.Gson;

import cn.net.sunrise.su.beans.container.ContainerStatusBean;
import cn.net.sunrise.su.beans.container.FieldStatusBean;
import cn.net.sunrise.su.beans.passport.PassportStatusBean;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.FieldKey;
import cn.net.sunrise.su.enums.PassportKey;

public final class ResultBody {
	
	private static Gson gson;
	static {
		gson = new Gson();
	}

	public static final String result(Object obj) {
		if (obj instanceof PassportKey) {
			return gson.toJson(new PassportStatusBean((PassportKey)obj));
		}
		if (obj instanceof ContainerKey) {
			return gson.toJson(new ContainerStatusBean((ContainerKey)obj));
		}
		if (obj instanceof FieldKey) {
			return gson.toJson(new FieldStatusBean((FieldKey)obj));
		}
		if ((obj instanceof PassportStatusBean) || (obj instanceof ContainerStatusBean) || (obj instanceof FieldStatusBean)) {
			return gson.toJson(obj);
		}
		throw new RuntimeException("Unknown OR Unsupport object type.");
	}
}
