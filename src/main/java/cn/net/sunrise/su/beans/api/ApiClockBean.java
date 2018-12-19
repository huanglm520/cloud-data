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
	// 代码块初始化存储区
	{
		this.year = this.month = this.day = this.hour = this.minute = this.second = 0;
	}
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
	// 固定时间初始化
	public ApiClockBean(int year, int month, int day, int hour, int minute, int second) {
		this.year = year;
		this.month = month;
		this.day = day;
		this.hour = hour;
		this.minute = minute;
		this.second = second;
	}
	// 默认初始化函数
	public ApiClockBean() {
		// Empty
	}
	
	// 设置Get和Set接口
	public void setYear(int year) {
		this.year = year;
	}
	public int getYear() {
		return this.year;
	}
	
	public void setMonth(int month) {
		this.month = month;
	}
	public int getMonth() {
		return this.month;
	}
	
	public void setDay(int day) {
		this.day = day;
	}
	public int getDay() {
		return this.day;
	}
	
	public void setHour(int hour) {
		this.hour = hour;
	}
	public int getHour() {
		return this.hour;
	}
	
	public void setMinute(int minute) {
		this.minute = minute;
	}
	public int getMinute() {
		return this.minute;
	}
	
	public void setSecond(int second) {
		this.second = second;
	}
	public int getSecond() {
		return this.second;
	}
}
