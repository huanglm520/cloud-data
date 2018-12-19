package cn.net.sunrise.su.service;

import java.util.List;

import cn.net.sunrise.su.beans.passport.LoginRecordBean;
import cn.net.sunrise.su.beans.passport.LoginRecordStatisticsBean;
import cn.net.sunrise.su.beans.passport.LoginRecordTimeBean;
import cn.net.sunrise.su.beans.passport.PassportStatusBean;
import cn.net.sunrise.su.beans.passport.UserBean;

public interface PassportService {
	
	public PassportStatusBean doLogin(UserBean usb, UserBean[] sessionUser);
	
	public PassportStatusBean doRegisterStep1(UserBean usb);
	public PassportStatusBean doRegisterStep2(UserBean usb);
	public PassportStatusBean doRegisterStep3(UserBean usb);
	public PassportStatusBean doRegisterStep4(UserBean usb);
	
	public PassportStatusBean doForgetPasswordStep1(UserBean usb);
	public PassportStatusBean doForgetPasswordStep2(UserBean usb);
	public PassportStatusBean doForgetPasswordStep3(UserBean usb);
	
	public PassportStatusBean doChangeMailStep1(UserBean usb);
	public PassportStatusBean doChangeMailStep2(UserBean usb);
	
	public PassportStatusBean doChangePasswordStep1(UserBean usb);
	
	public void insertLoginRecord(LoginRecordBean lrb);
	public List<LoginRecordBean> selectLoginRecord(LoginRecordTimeBean lrtb);
	public List<LoginRecordBean> selectLoginRecordLimit(LoginRecordTimeBean lrtb);
	public List<LoginRecordStatisticsBean> selectLoginRecordStatistics(LoginRecordTimeBean lrtb);
	
	public PassportStatusBean updateName(UserBean usb);
	public PassportStatusBean updateCompany(UserBean usb);
	
	public List<UserBean> selectUserByAccount(UserBean userBean);
	public List<UserBean> selectUserById(UserBean userBean);
}
