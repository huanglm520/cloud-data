package cn.net.sunrise.su.runtime.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.net.sunrise.su.beans.passport.LoginRecordBean;
import cn.net.sunrise.su.beans.passport.LoginRecordStatisticsBean;
import cn.net.sunrise.su.beans.passport.LoginRecordTimeBean;
import cn.net.sunrise.su.dao.BaseDao;
import cn.net.sunrise.su.dao.LoginRecordDao;

@Repository
public class LoginRecordDaoImpl extends BaseDao implements LoginRecordDao {
	
	public LoginRecordDaoImpl() {
		// TODO Auto-generated constructor stub
		super("cn.net.sunrise.su.config.mapper.login-record-mapper.xml.");
	}
	
	@Override
	public void insert(LoginRecordBean lrb) {
		// TODO Auto-generated method stub
		super.insert("insertRecord", lrb);
	}

	@Override
	public List<LoginRecordBean> select(LoginRecordTimeBean lrtb) {
		// TODO Auto-generated method stub
		return super.select("selectRecord", lrtb);
	}

	@Override
	public List<LoginRecordBean> selectLimit(LoginRecordTimeBean lrtb) {
		// TODO Auto-generated method stub
		return super.select("selectRecordLimit", lrtb);
	}

	@Override
	public List<LoginRecordStatisticsBean> selectStatistics(LoginRecordTimeBean lrtb) {
		// TODO Auto-generated method stub
		return super.select("selectRecordStatistics", lrtb);
	}

}
