package cn.net.sunrise.su.runtime.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.dao.BaseDao;
import cn.net.sunrise.su.dao.UserQueryDao;

@Repository
public class UserQueryDaoImpl extends BaseDao implements UserQueryDao {

	public UserQueryDaoImpl() {
		// TODO Auto-generated constructor stub
		super("cn.net.sunrise.su.config.mapper.user-mapper.xml.");
	}
	
	@Override
	public void insert(UserBean usb) {
		// TODO Auto-generated method stub
		super.insert("insertUser", usb);
	}

	@Override
	public void update(UserBean usb) {
		// TODO Auto-generated method stub
		super.update("updateUser", usb);
	}

	@Override
	public void delete(UserBean usb) {
		// TODO Auto-generated method stub
		super.delete("deleteUser", usb);
	}

	@Override
	public List<UserBean> select(UserBean usb) {
		// TODO Auto-generated method stub
		return super.select("selectUser", usb);
	}
	
	@Override
	public List<UserBean> selectUserById(UserBean usb) {
		return super.select("selectUserById", usb);
	}

	@Override
	public boolean exists(UserBean usb) {
		// TODO Auto-generated method stub
		return super.selectOne("existsUser", usb) != null;
	}

}
