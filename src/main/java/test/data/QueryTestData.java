package test.data;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.Random;

public class QueryTestData {

	public static void main(String[] args) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
		Random random = new Random();
		Date date = new Date();
		date.setTime(date.getTime()-24*60*60*1000*20L);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Integer[] cid = {35,36};
		Integer[] uid = {11,12,13};
		String[] operator = {"query", "update"};
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_cloud_data", "root", "123456");
		Statement statement = connection.createStatement();
		String sqlTemplate = "insert into tb_query values(null,%s,%s,'%s',%s,'%s')";
		while (!simpleDateFormat.format(date).equals("2019-05-25")) {
			String ip = (random.nextInt(254)+1)+"."+(random.nextInt(254)+1)+"."+(random.nextInt(254)+1)+"."+(random.nextInt(254)+1);
			String ip2 = Base64.getEncoder().encodeToString(ip.getBytes("GBK"));
			String sql = String.format(sqlTemplate, cid[random.nextInt(cid.length)].toString(),
					uid[random.nextInt(uid.length)].toString(), ip2, Long.toString(date.getTime()),
					operator[random.nextInt(operator.length)]);
			statement.executeUpdate(sql);
			date.setTime(date.getTime()+60*1000L);
		}
		statement.close();
		connection.close();
	}
}
