package cn.net.sunrise.su.listener;

import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.runtime.task.PageDateTask;

@WebListener
public class ContextListenrer implements ServletContextListener {
	
	// 系统启动后可通过ContextListener.ApplicationContext获取全局application对象
	public static ServletContext ApplicationContext;
	
	private static Logger logger = LogManager.getLogger(ContextListenrer.class);

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		ApplicationContext = sce.getServletContext();
		logger.info("全局对象已加载，现在可通过ContextListener.ApplicationContext获取全局application对象");
		// 初始化系统时间
		ApplicationContext.setAttribute(AttributeKey.PAGE_TIME.key, PageDateTask.simpleDateFormat.format(new Date()));
		logger.info("页面时间已经初始化");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		logger.info("全局对象已被销毁");
	}

}
