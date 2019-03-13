package cn.net.sunrise.su.tool;

import java.util.Random;

public class VerCode {
	
	private static final Random random;
	static {
		random = new Random();
	}
	
	public static String vercode() {
		StringBuffer vercodeString = new StringBuffer();
		for (int i=0; i<6; i++) {
			vercodeString.append(VerCode.random.nextInt(10));
		}
		return vercodeString.toString();
	}
	
	private VerCode() {
		throw new Error("No such object for class: " + this.getClass().getName());
	}
}
