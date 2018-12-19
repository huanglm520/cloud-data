package cn.net.sunrise.su.listener;

/*
 * 这个破玩意写出来就从来没用过
 * 我也不知道当时为啥要写这个东西
 * @auther Huang Liming
 * 2018-12-18 note ver1
 */

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListenrer implements ServletContextListener {
	
	// 系统启动后可通过ContextListener.ApplicationContext获取全局application对象
	public static ServletContext ApplicationContext;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		ApplicationContext = sce.getServletContext();
		System.out.println("全局对象已加载，现在可通过ContextListener.ApplicationContext获取全局application对象");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("全局对象已被销毁");
	}

}
