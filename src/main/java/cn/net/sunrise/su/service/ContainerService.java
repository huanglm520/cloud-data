package cn.net.sunrise.su.service;

import java.util.List;

import cn.net.sunrise.su.beans.ContainerBean;
import cn.net.sunrise.su.beans.ContainerNewBean;
import cn.net.sunrise.su.beans.ContainerPrivilegeBean;
import cn.net.sunrise.su.beans.ContainerQueryBean;
import cn.net.sunrise.su.beans.ContainerQueryTimeBean;
import cn.net.sunrise.su.beans.ContainerStatisticsBean;
import cn.net.sunrise.su.beans.FieldBean;

public interface ContainerService {

	public Object addContainer(ContainerBean containerBean);
	public List<ContainerStatisticsBean> selectContainerStatistics(ContainerBean containerBean);
	public List<ContainerBean> selectContainer(ContainerBean containerBean);
	public List<ContainerBean> selectContainerById(ContainerBean containerBean);
	public List<ContainerPrivilegeBean> selectPrivilegeByCid(ContainerPrivilegeBean containerPrivilegeBean);
	public boolean hasPrivilege(ContainerBean containerBean);
	public void updateContainer(ContainerBean containerBean);
	public boolean isOwner(ContainerBean containerBean);
	public void dropContainer(ContainerBean containerBean);
	public boolean existsPrivilege(ContainerPrivilegeBean containerPrivilegeBean);
	public void addPrivilege(ContainerPrivilegeBean containerPrivilegeBean);
	public List<ContainerPrivilegeBean> selectPrivilegeById(ContainerPrivilegeBean containerPrivilegeBean);
	public void deletePrivilegeById(ContainerPrivilegeBean containerPrivilegeBean);
	public void addContainerField(ContainerBean containerBean, FieldBean fieldBean);
	public void plusOneField(ContainerBean containerBean);
	public void updateContainerField(ContainerBean containerBean, FieldBean fieldBean);
	public void deleteContainerField(ContainerBean containerBean, FieldBean fieldBean);
	public void subOneField(ContainerBean containerBean);
	public void lockContainer(ContainerBean containerBean);
	public void unlockContainer(ContainerBean containerBean);
	public boolean isLocked(ContainerBean containerBean);
	public boolean hasGuest(ContainerBean containerBean);
	public int containerDataCount(ContainerNewBean containerNewBean);
	public void insertQueryRecord(ContainerQueryBean containerQueryBean);
	public Object selectQueryRecord(ContainerQueryTimeBean containerQueryTimeBean);
}
