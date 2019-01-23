package cn.net.sunrise.su.transmission;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;

import org.apache.logging.log4j.LogManager;

import cn.net.sunrise.su.beans.transmission.CdcbfBean;

public class CdcbfDecoder {
	
	public static CdcbfBean decode(String filePath) throws IOException {
		
		ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream(filePath));
		try {
			CdcbfBean bean = (CdcbfBean) inputStream.readObject();
			return bean;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			LogManager.getLogger().error(e);
		} finally {
			inputStream.close();
		}
		return null;
	}
	
}