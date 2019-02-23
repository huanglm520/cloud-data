package cn.net.sunrise.su.dao;

import java.util.List;

import cn.net.sunrise.su.beans.ContainerPrivilegeBean;

public interface ContainerPrivilegeDao {

	public void insertPrivilegeByAccount(ContainerPrivilegeBean containerPrivilegeBean);
	public void insertPrivilegeByUid(ContainerPrivilegeBean containerPrivilegeBean);
	public void updatePrivilege(ContainerPrivilegeBean containerPrivilegeBean);
	public void deletePrivilegeById(ContainerPrivilegeBean containerPrivilegeBean);
	public void deletePrivilegeByCid(ContainerPrivilegeBean containerPrivilegeBean);
	public void deletePrivilegeByUid(ContainerPrivilegeBean containerPrivilegeBean);
	public List<ContainerPrivilegeBean> selectPrivilegeById(ContainerPrivilegeBean containerPrivilegeBean);
	public List<ContainerPrivilegeBean> selectPrivilegeByCid(ContainerPrivilegeBean containerPrivilegeBean);
	public List<ContainerPrivilegeBean> selectPrivilegeByAccount(ContainerPrivilegeBean containerPrivilegeBean);
	public boolean existsPrivilege(ContainerPrivilegeBean containerPrivilegeBean);
	public List<ContainerPrivilegeBean> selectPrivilegeByCidUid(ContainerPrivilegeBean containerPrivilegeBean);
}
