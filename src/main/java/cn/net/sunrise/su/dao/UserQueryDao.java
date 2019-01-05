package cn.net.sunrise.su.dao;

import java.util.List;

import cn.net.sunrise.su.beans.passport.UserBean;

public interface UserQueryDao {
	
	public void insert(UserBean usb);
	public void update(UserBean usb);
	public void delete(UserBean usb);
	public List<UserBean> select(UserBean usb);
	public List<UserBean> selectUserById(UserBean usb);
	public boolean exists(UserBean usb);
	public boolean existsById(UserBean usb);
}
