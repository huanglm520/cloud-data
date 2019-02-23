package cn.net.sunrise.su.beans;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class BaseBean {

	protected BaseBean() {
		
	}
	
	protected static String base64EncodeString(String string) {
		if (string != null) {
			try {
				return Base64.getEncoder().encodeToString(string.getBytes("GBK"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	protected static String base64DecodeString(String string) {
		if (string != null) {
			try {
				return new String(Base64.getDecoder().decode(string), "GBK");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
}
