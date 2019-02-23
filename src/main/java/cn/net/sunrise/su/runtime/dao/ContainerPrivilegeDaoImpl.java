package cn.net.sunrise.su.runtime.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.net.sunrise.su.beans.ContainerPrivilegeBean;
import cn.net.sunrise.su.dao.BaseDao;
import cn.net.sunrise.su.dao.ContainerPrivilegeDao;

@Repository
public class ContainerPrivilegeDaoImpl extends BaseDao implements ContainerPrivilegeDao {
	
	public ContainerPrivilegeDaoImpl() {
		// TODO Auto-generated constructor stub
		super("cn.net.sunrise.su.config.mapper.container-privilege-mapper.xml.");
	}

	@Override
	public void insertPrivilegeByAccount(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		super.insert("insertPrivilegeByAccount", containerPrivilegeBean);
	}

	@Override
	public void insertPrivilegeByUid(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		super.insert("insertPrivilegeByUid", containerPrivilegeBean);
	}

	@Override
	public void updatePrivilege(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		super.update("updatePrivilege", containerPrivilegeBean);
	}

	@Override
	public void deletePrivilegeById(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		super.delete("deletePrivilegeById", containerPrivilegeBean);
	}

	@Override
	public void deletePrivilegeByCid(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		super.delete("deletePrivilegeByCid", containerPrivilegeBean);
	}

	@Override
	public void deletePrivilegeByUid(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		super.delete("deletePrivilegeByUid", containerPrivilegeBean);
	}

	@Override
	public List<ContainerPrivilegeBean> selectPrivilegeById(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		return super.select("selectPrivilegeById", containerPrivilegeBean);
	}

	@Override
	public List<ContainerPrivilegeBean> selectPrivilegeByCid(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		return super.select("selectPrivilegeByCid", containerPrivilegeBean);
	}

	@Override
	public List<ContainerPrivilegeBean> selectPrivilegeByAccount(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		return super.select("selectPrivilegeByAccount", containerPrivilegeBean);
	}

	@Override
	public boolean existsPrivilege(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		return super.selectOne("existsPrivilege", containerPrivilegeBean) != null;
	}

	@Override
	public List<ContainerPrivilegeBean> selectPrivilegeByCidUid(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		return super.select("selectPrivilegeByCidUid", containerPrivilegeBean);
	}

}
