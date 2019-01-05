package cn.net.sunrise.su.runtime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.net.sunrise.su.beans.passport.LoginRecordBean;
import cn.net.sunrise.su.beans.passport.LoginRecordStatisticsBean;
import cn.net.sunrise.su.beans.passport.LoginRecordTimeBean;
import cn.net.sunrise.su.beans.passport.PassportStatusBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.dao.LoginRecordDao;
import cn.net.sunrise.su.dao.UserQueryDao;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.PassportService;
import cn.net.sunrise.su.tool.SaltTool;
import cn.net.sunrise.su.tool.UserCheck;

@Service
public class PassportServiceImpl implements PassportService {
	
	@Autowired
	private UserQueryDao userQueryDao;
	@Autowired
	private LoginRecordDao lrd;

	@Override
	public PassportStatusBean doLogin(UserBean usb, UserBean[] sessionUser) {
		// TODO Auto-generated method stub
		
		// 定义登录信息返回封装对象
		PassportStatusBean lsb = null; 
		// 检查session中是否存在
		// 如果存在则无需读取数据库
		// 否则需要从数据库中提取数据
		if (sessionUser[0] == null) {
			// 从数据库拉取数据
			List<UserBean> list = this.userQueryDao.select(usb);
			if (list != null && list.size() != 0) {
				sessionUser[0] = list.get(0);
			}
		}
		
		// 如果从数据库中拉去的数据仍然是空，则用户不存在
		if (sessionUser[0] == null) {
			lsb = new PassportStatusBean();
			lsb.setCode(PassportKey.ACCOUNT_NOT_EXISTS.code);
			lsb.setMessage(PassportKey.ACCOUNT_NOT_EXISTS.message);
			return lsb;
		}
		
		// 编译用户密码并进行对比
		usb.setSalt(sessionUser[0].getSalt());
		usb.encodePassword();
		if (!usb.getPassword().equals(sessionUser[0].getPassword())) {
			lsb = new PassportStatusBean();
			lsb.setCode(PassportKey.PASSWORD_WRONG.code);
			lsb.setMessage(PassportKey.PASSWORD_WRONG.message);
			return lsb;
		}
		
		// 认证完成
		lsb = new PassportStatusBean();
		lsb.setCode(PassportKey.OK.code);
		lsb.setMessage(PassportKey.OK.message);
		return lsb;
	}

	@Override
	public PassportStatusBean doRegisterStep1(UserBean usb) {
		// TODO Auto-generated method stub
		// 校验数据
		if (!UserCheck.checkAccount(usb.getAccount())) {
			return new PassportStatusBean(PassportKey.ACCOUNT_NOT_ACCEPT);
		}
		
		if (!UserCheck.checkFirst_Name(usb.getFirst_name())) {
			return new PassportStatusBean(PassportKey.FIRST_NAME_NOT_ACCEPT);
		}
		
		if (!UserCheck.checkLast_name(usb.getLast_name())) {
			return new PassportStatusBean(PassportKey.LAST_NAME_NOT_ACCEPT);
		}
		
		if (!UserCheck.checkCompany(usb.getCompany())) {
			return new PassportStatusBean(PassportKey.COMPANY_NOT_ACCEPT);
		}
		usb.encodeAccount();
		// 检查邮箱是否被注册
		if (this.userQueryDao.exists(usb)) {
			return new PassportStatusBean(PassportKey.ACCOUNT_ALREADY_EXISTS);
		}
		usb.decodeAccount();
		
		return new PassportStatusBean(PassportKey.OK);
	}

	@Override
	public PassportStatusBean doRegisterStep2(UserBean usb) {
		// TODO Auto-generated method stub
		// 检查密码
		if (!UserCheck.checkPassword(usb.getPassword())) {
			return new PassportStatusBean(PassportKey.PASSWORD_NOT_ACCEPT);
		}
		
		return new PassportStatusBean(PassportKey.OK);
	}
	
	@Override
	public PassportStatusBean doRegisterStep3(UserBean usb) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PassportStatusBean doRegisterStep4(UserBean usb) {
		// TODO Auto-generated method stub
		// 编译用户名
		usb.encodeAccount();
		// 编译用户信息，防止乱码
		usb.encode();
		// 记录注册日期
		usb.setRegtime(System.currentTimeMillis());
		// 生成加密盐
		usb.setSalt(SaltTool.salt());
		// 编译密码
		usb.encodePassword();
		// 写入数据库
		this.userQueryDao.insert(usb);
		
		return new PassportStatusBean(PassportKey.OK);
	}
	
	@Override
	public PassportStatusBean doForgetPasswordStep1(UserBean usb) {
		// TODO Auto-generated method stub
		// 查询账号是否只存在
		usb.encodeAccount();
		if (!userQueryDao.exists(usb)) {
			return new PassportStatusBean(PassportKey.ACCOUNT_NOT_EXISTS);
		}
		
		UserBean user = userQueryDao.select(usb).get(0);
		
		// 回写数据
		usb.setAccount(user.getAccount());
		usb.setCompany(user.getCompany());
		usb.setFirst_name(user.getFirst_name());
		usb.setId(user.getId());
		usb.setLast_name(user.getLast_name());
		usb.setPassword(user.getPassword());
		usb.setRegtime(user.getRegtime());
		usb.setSalt(user.getSalt());
		
		usb.decodeAccount();
		usb.decode();
		
		return new PassportStatusBean(PassportKey.OK);
	}

	@Override
	public PassportStatusBean doForgetPasswordStep2(UserBean usb) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PassportStatusBean doForgetPasswordStep3(UserBean usb) {
		// TODO Auto-generated method stub
		// 检查用户数据
		if (!UserCheck.checkPassword(usb.getPassword())) {
			return new PassportStatusBean(PassportKey.PASSWORD_NOT_ACCEPT);
		} 
		
		// 编译密码
		usb.encodeAccount();
		usb.encodePassword();
		usb.encode();
		this.userQueryDao.update(usb);
		
		return new PassportStatusBean(PassportKey.OK);
	}

	@Override
	public PassportStatusBean doChangeMailStep1(UserBean usb) {
		// TODO Auto-generated method stub
		usb.encodeAccount();
		if (this.userQueryDao.exists(usb)) {
			return new PassportStatusBean(PassportKey.ACCOUNT_ALREADY_EXISTS);
		}
		usb.decodeAccount();
		return new PassportStatusBean(PassportKey.OK);
	}

	@Override
	public PassportStatusBean doChangeMailStep2(UserBean usb) {
		// TODO Auto-generated method stub
		usb.encode();
		usb.encodeAccount();
		this.userQueryDao.update(usb);
		usb.decode();
		usb.decodeAccount();
		return new PassportStatusBean(PassportKey.OK);
	}

	@Override
	public PassportStatusBean doChangePasswordStep1(UserBean usb) {
		// TODO Auto-generated method stub
		// 验证密码合法性
		if (!UserCheck.checkPassword(usb.getPassword())) {
			return new PassportStatusBean(PassportKey.PASSWORD_NOT_ACCEPT);
		}
		// 写入数据
		usb.encodePassword();
		usb.encodeAccount();
		usb.encode();
		this.userQueryDao.update(usb);
		return new PassportStatusBean(PassportKey.OK);
	}
	
	@Override
	public void insertLoginRecord(LoginRecordBean lrb) {
		// TODO Auto-generated method stub
		this.lrd.insert(lrb);
	}

	@Override
	public List<LoginRecordBean> selectLoginRecord(LoginRecordTimeBean lrtb) {
		// TODO Auto-generated method stub
		return this.lrd.select(lrtb);
	}

	@Override
	public List<LoginRecordBean> selectLoginRecordLimit(LoginRecordTimeBean lrtb) {
		// TODO Auto-generated method stub
		return this.lrd.selectLimit(lrtb);
	}

	@Override
	public List<LoginRecordStatisticsBean> selectLoginRecordStatistics(LoginRecordTimeBean lrtb) {
		// TODO Auto-generated method stub
		return this.lrd.selectStatistics(lrtb);
	}

	@Override
	public PassportStatusBean updateName(UserBean usb) {
		// TODO Auto-generated method stub
		usb.encodeAccount();
		usb.encode();
		this.userQueryDao.update(usb);
		// 反编码数据
		usb.decodeAccount();
		usb.decode();
		return new PassportStatusBean(PassportKey.OK);
	}

	@Override
	public PassportStatusBean updateCompany(UserBean usb) {
		// TODO Auto-generated method stub
		this.updateName(usb);
		return new PassportStatusBean(PassportKey.OK);
	}

	@Override
	public List<UserBean> selectUserByAccount(UserBean userBean) {
		// TODO Auto-generated method stub
		return this.userQueryDao.select(userBean);
	}

	@Override
	public List<UserBean> selectUserById(UserBean userBean) {
		// TODO Auto-generated method stub
		return this.userQueryDao.selectUserById(userBean);
	}

	@Override
	public boolean exists(UserBean userBean) {
		// TODO Auto-generated method stub
		return this.userQueryDao.exists(userBean);
	}

	@Override
	public boolean existsById(UserBean userBean) {
		// TODO Auto-generated method stub
		return this.userQueryDao.existsById(userBean);
	}
	
}
