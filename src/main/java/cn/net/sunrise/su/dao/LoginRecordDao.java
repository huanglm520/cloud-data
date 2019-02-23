package cn.net.sunrise.su.dao;

import java.util.List;

import cn.net.sunrise.su.beans.LoginRecordBean;
import cn.net.sunrise.su.beans.LoginRecordStatisticsBean;
import cn.net.sunrise.su.beans.LoginRecordTimeBean;

public interface LoginRecordDao {
	
	public void insert(LoginRecordBean lrb);
	
	public List<LoginRecordBean> select(LoginRecordTimeBean lrtb);
	
	public List<LoginRecordBean> selectLimit(LoginRecordTimeBean lrtb);
	
	public List<LoginRecordStatisticsBean> selectStatistics(LoginRecordTimeBean lrtb);
}
