package cn.net.sunrise.su.runtime.tool;

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
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Mail {
	
	// 定义信息源
	@Value("${mail.server.address}")
	private String SERVER;
	@Value("${mail.server.port}")
	private String PORT;
	@Value("${mail.server.username}")
	private String USER;
	@Value("${mail.server.password}")
	private String PASSWORD;
	@Value("${mail.server.fromnick}")
	private String FROMNICK;
	@Value("${mail.server.auth}")
	private String AUTH;
	@Value("${mail.server.ssl}")
	private String SSL;
	
	@Value("${mail.message.register}")
	public String RegisterMessage;
	@Value("${mail.message.forgetpassword}")
	public String ForgetPasswordMessage;
	@Value("${mail.message.changemail}")
	public String ChangeMailMessage;
	@Value("${mail.message.subject}")
	public String SubjectMessage;
	
	// 私有化构造器，防止外部生成对象
	private Mail() {}

	
	private static Mail mail;
	
	private static Logger logger = LogManager.getLogger(Mail.class);

	@Autowired
	private void setMail(Mail mail) {
		Mail.mail = mail;
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
			logger.error(e);
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
			logger.error(e);
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "Mail [SERVER=" + SERVER + ", PORT=" + PORT + ", USER=" + USER + ", PASSWORD=" + PASSWORD + ", FROMNICK="
				+ FROMNICK + ", AUTH=" + AUTH + ", SSL=" + SSL + ", RegisterMessage=" + RegisterMessage
				+ ", ForgetPasswordMessage=" + ForgetPasswordMessage + ", ChangeMailMessage=" + ChangeMailMessage
				+ ", SubjectMessage=" + SubjectMessage + "]";
	}

	
}
