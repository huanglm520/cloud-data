package cn.net.sunrise.su.tool;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.logging.log4j.LogManager;

public class Mail {
	
	// 定义信息源
	private final String SERVER;
	private final String PORT;
	private final String USER;
	private final String PASSWORD;
	private final String FROMNICK;
	private final String AUTH;
	private final String SSL;
	
	public final String RegisterMessage;
	public final String ForgetPasswordMessage;
	public final String ChangeMailMessage;
	public final String SubjectMessage;
	
	// 初始化信息源
	{
		Properties properties = PropertiesLoader.loadProperties(Mail.class, "/config/mail-config.properties");
		SERVER = properties.getProperty("server");
		PORT = properties.getProperty("port");
		USER = properties.getProperty("user");
		PASSWORD = properties.getProperty("password");
		FROMNICK = properties.getProperty("fromnick");
		AUTH = properties.getProperty("auth");
		SSL = properties.getProperty("ssl");
		
		// 初始化消息对象
		RegisterMessage = properties.getProperty("RegisterMessage");
		ForgetPasswordMessage = properties.getProperty("ForgetPasswordMessage");
		ChangeMailMessage = properties.getProperty("ChangeMailMessage");
		SubjectMessage = properties.getProperty("SubjectMessage");
	}
	
	// 私有化构造器，防止外部生成对象
	private Mail() {}

	
	private static final Mail mail;
	
	static {
		mail = new Mail();
	}
	
	// 外部接口，用于获取MailSocket对象
	public static Mail getMail() {
		return mail;
	}
	
	public boolean send(String receiveAddress, String receiveNick, String subject, String message) {
		// 建立邮件属性
		Properties mailProperties = new Properties();
		mailProperties.setProperty("mail.transport.protocol", "smtp");
		mailProperties.setProperty("mail.smtp.host", this.SERVER);
		mailProperties.setProperty("mail.smtp.port", this.PORT);
		mailProperties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		mailProperties.setProperty("mail.smtp.auth", this.AUTH);
		mailProperties.setProperty("mail.smtp.ssl.enable", this.SSL);
		
		// 创建配置会话
		Session session = Session.getDefaultInstance(mailProperties);
		session.setDebug(false);
		
		// 根据当前会话创建邮件
		MimeMessage mimeMessage = new MimeMessage(session);
		
		// 设置邮件信息
		try {
			mimeMessage.setFrom(new InternetAddress(this.USER, this.FROMNICK, "UTF-8"));
			mimeMessage.setRecipient(RecipientType.TO, new InternetAddress(receiveAddress, receiveNick, "UTF-8"));
			mimeMessage.setSubject(subject, "UTF-8");
			mimeMessage.setText(message, "UTF-8");
			mimeMessage.setSentDate(new Date());
			mimeMessage.saveChanges();
		} catch (UnsupportedEncodingException | MessagingException e) {
			// TODO Auto-generated catch block
			LogManager.getLogger().error(e);
			return false;
		}
		
		// 创建邮件发送通道
		try {
			Transport transport = session.getTransport();
			transport.connect(this.SERVER, this.USER, this.PASSWORD);
			transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
			transport.close();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			LogManager.getLogger().error(e);
			return false;
		}
		return true;
	}

}
