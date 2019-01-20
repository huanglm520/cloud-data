package cn.net.sunrise.su.service;

import java.util.List;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.ContainerPrivilegeBean;
import cn.net.sunrise.su.beans.container.ContainerStatisticsBean;
import cn.net.sunrise.su.beans.container.FieldBean;

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
}
