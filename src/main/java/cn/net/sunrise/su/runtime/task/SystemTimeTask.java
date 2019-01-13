package cn.net.sunrise.su.runtime.task;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import cn.net.sunrise.su.beans.api.ApiClockBean;

@Component
@Lazy(value = false)
public class SystemTimeTask extends Thread {

	// 刷新系统时间
	@Scheduled(cron = "0/1 * * * * ?")
	@Override
	public void run() {
		ApiClockBean bean = ApiClockBean.apiClockBean;
		int second = bean.getSecond();
		int minute = bean.getMinute();
		int hour   = bean.getHour();
		int day    = bean.getDay();
		int month  = bean.getMonth();
		int year   = bean.getYear();
		second ++ ;
		if (second >= 60) {
			second = 0;
			minute ++ ;
		}
		if (minute >= 60) {
			minute = 0;
			hour ++ ;
		}
		if (hour >= 24) {
			hour = 0;
			day ++ ;
		}
		if (day > monthDay(month, year)) {
			day = 1;
			month ++ ;
		}
		
		if (month > 12) {
			month = 1;
			year ++ ;
		}
		
		bean.setSecond(second);
		bean.setMinute(minute);
		bean.setHour(hour);
		bean.setDay(day);
		bean.setMonth(month);
		bean.setYear(year);
		
	}
	
	private int monthDay(int month, int year) {
		switch (month) {
			case 1: case 3: case 5: case 7: case 8: case 10: case 12: return 31;
			case 2: return (year%4==0 && year%100!=0 || year%400==0) ? 29 : 28;
			default: return 30;
		}
	}
}
