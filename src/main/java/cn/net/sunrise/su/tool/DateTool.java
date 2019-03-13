package cn.net.sunrise.su.tool;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTool {

	public static class Section {
		public final long sTime;
		public final long eTime;
		Section(long sTime, long eTime) {
			this.sTime = sTime;
			this.eTime = eTime;
		}
	}
	
	private static int monthDays(int y, int m) {
		switch(m) {
			case 1: case 3: case 5: case 7: case 8: case 10: case 12: return 31;
			case 4: case 6: case 9: case 11: return 30;
			default: return y%4==0&&y%100!=0 || y%400==0 ? 29 : 28;
		}
	}
	
	public static Section getMonthSectionMillis(Date date) {
		String timeStr = new SimpleDateFormat("yyyy-MM").format(date);
		String[] strs = timeStr.split("-");
		int day = DateTool.monthDays(Integer.parseInt(strs[0]), Integer.parseInt(strs[1]));
		String sTimeStr = timeStr + "-01 00:00:00 000";
		String eTimeStr = timeStr + "-" + day + " 23:59:59 999";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(sdf.parse(sTimeStr));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long sTime = calendar.getTimeInMillis();
		try {
			calendar.setTime(sdf.parse(eTimeStr));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long eTime = calendar.getTimeInMillis();
		return new Section(sTime, eTime);
	}
	
	private DateTool() {
		throw new Error("No such object for class: " + this.getClass().getName());
	}
}
