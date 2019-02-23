package cn.net.sunrise.su.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class test {

	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		Random random = new Random();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		date.setTime(date.getTime()-24*60*60*1000*20L);
		Integer[] cid = {35, 36};
		Integer[] uid = {11, 12, 13};
		String[] querytype = {"query", "update"};
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_cloud_data", "root", "123456");
		Statement statement = connection.createStatement();
		String sqlTemplate = "insert into tb_query values(null, %s, %s, '%s', %s, '%s');";
		while (!sdf.format(date).equals("2019-02-25")) {
			// 生成随机IP
			
			// 测试数据跨度1min
			date.setTime(date.getTime()+60*60*1000L);
		}
	}
}
