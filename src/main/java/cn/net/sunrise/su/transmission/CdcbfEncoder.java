package cn.net.sunrise.su.transmission;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

import org.apache.logging.log4j.LogManager;

import cn.net.sunrise.su.beans.transmission.CdcbfBean;

public class CdcbfEncoder {

	public static void encode(CdcbfBean cdcbfBean) throws IOException  {
		
		ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream(""));
		try {
			outputStream.writeObject(cdcbfBean);
			outputStream.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			LogManager.getLogger().error(e);
		} finally {
			outputStream.close();
		}
		
	}
}
