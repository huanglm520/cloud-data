package cn.net.sunrise.su.runtime.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.listener.ContextListenrer;

@Component
@Lazy(value = false)
public class PageDateTask extends Thread {
	
	public static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy"); 

	// 每年的1月1日0点刷新系统年份数据
	// 保证页面底部时间正确
	@Scheduled(cron = "0 0 0 1 1 ?")
	@Override
	public void run() {
		ContextListenrer.ApplicationContext.setAttribute(AttributeKey.PAGE_TIME.key, simpleDateFormat.format(new Date()));
		LogManager.getLogger().info("===========已刷新页面时间常量=========");
	}
}
