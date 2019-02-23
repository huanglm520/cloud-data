package cn.net.sunrise.su.service;

import java.util.List;

import cn.net.sunrise.su.beans.LoginRecordBean;
import cn.net.sunrise.su.beans.LoginRecordStatisticsBean;
import cn.net.sunrise.su.beans.LoginRecordTimeBean;
import cn.net.sunrise.su.beans.UserBean;
import cn.net.sunrise.su.enums.PassportKey;

public interface PassportService {
	
	public PassportKey doLogin(UserBean usb, UserBean[] sessionUser);
	
	public PassportKey doRegisterStep1(UserBean usb);
	public PassportKey doRegisterStep2(UserBean usb);
	public PassportKey doRegisterStep3(UserBean usb);
	public PassportKey doRegisterStep4(UserBean usb);
	
	public PassportKey doForgetPasswordStep1(UserBean usb);
	public PassportKey doForgetPasswordStep2(UserBean usb);
	public PassportKey doForgetPasswordStep3(UserBean usb);
	
	public PassportKey doChangeMailStep1(UserBean usb);
	public PassportKey doChangeMailStep2(UserBean usb);
	
	public PassportKey doChangePasswordStep1(UserBean usb);
	
	public void insertLoginRecord(LoginRecordBean lrb);
	public List<LoginRecordBean> selectLoginRecord(LoginRecordTimeBean lrtb);
	public List<LoginRecordBean> selectLoginRecordLimit(LoginRecordTimeBean lrtb);
	public List<LoginRecordStatisticsBean> selectLoginRecordStatistics(LoginRecordTimeBean lrtb);
	
	public PassportKey updateName(UserBean usb);
	public PassportKey updateCompany(UserBean usb);
	
	public List<UserBean> selectUserByAccount(UserBean userBean);
	public List<UserBean> selectUserById(UserBean userBean);
	
	public boolean exists(UserBean userBean);
	public boolean existsById(UserBean userBean);
}
