package cn.net.sunrise.su.beans.api;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * api接口中的时间实体类
 * author: Sunrise(Huang Liming)
 */
public class ApiClockBean implements Serializable {
	private static final long serialVersionUID = 7055948513878980145L;
	
	// 实体类成员变量
	private int year;
	private int month;
	private int day;
	private int hour;
	private int minute;
	private int second;
	// Date对象初始化
	public ApiClockBean(Date date) {
		String[] vars = new SimpleDateFormat("yyyy MM dd HH mm ss").format(date).split(" ");
		this.year = Integer.parseInt(vars[0]);
		this.month = Integer.parseInt(vars[1]);
		this.day = Integer.parseInt(vars[2]);
		this.hour = Integer.parseInt(vars[3]);
		this.minute = Integer.parseInt(vars[4]);
		this.second = Integer.parseInt(vars[5]);
	}
	
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public int getMinute() {
		return minute;
	}

	public void setMinute(int minute) {
		this.minute = minute;
	}

	public int getSecond() {
		return second;
	}

	public void setSecond(int second) {
		this.second = second;
	}
	
	@Override
	public String toString() {
		return String.format("%04d-%02d-%02d %02d:%02d:%02d", year, month, day, hour, minute, second);
	}
}
