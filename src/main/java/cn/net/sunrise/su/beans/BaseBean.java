package cn.net.sunrise.su.beans;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class BaseBean implements Serializable, Cloneable {

	private static final long serialVersionUID = 4681592047689086453L;

	protected BaseBean() {
		
	}
	
	protected String base64EncodeString(String string) {
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
	
	protected String base64DecodeString(String string) {
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
	
	@Override
	protected Object clone() {
		try {
			// 将对象写入流中
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(baos);
			oos.writeObject(this);
			// 从流中读出对象
			ByteArrayInputStream bais = new ByteArrayInputStream(baos.toByteArray());
			ObjectInputStream ois = new ObjectInputStream(bais);
			return ois.readObject();
		} catch (IOException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	
//	public static void main(String[] args) {
//		UserBean userBean = new UserBean();
//		userBean.setAccount("123456");
//		UserBean userBean2 = userBean.clone();
//		System.out.println(userBean2.getAccount());
//		userBean2.setAccount("456789");
//		System.out.println(userBean == userBean2);
//		System.out.println(userBean.getAccount());
//		System.out.println(userBean2.getAccount());
//		System.out.println(userBean.getAccount() == userBean2.getAccount());
//	}
}
