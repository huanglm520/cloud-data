package cn.net.sunrise.su.tool;

import java.util.Random;

public class SaltTool {

	private static String charts;
	private static Random random;
	static {
		charts = "`1234567890-=~!@#$%^&*()_+qwertyuiopasdfghjklzxcvbnmm,.QWERTYUIOPASDFGHJKLZXCVBNM";
		random = new Random();
	}
	public static String salt() {
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<16; i++) {
			sb.append(charts.charAt(random.nextInt(charts.length())));
		}
		return sb.toString();
	}
	
	private SaltTool() {
		throw new Error("No such object for class: " + this.getClass().getName());
	}
}
