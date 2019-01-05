package cn.net.sunrise.su.service;

import java.util.List;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.ContainerPrivilegeBean;
import cn.net.sunrise.su.beans.container.ContainerStatisticsBean;
import cn.net.sunrise.su.beans.container.ContainerStatusBean;

public interface ContainerService {

	public ContainerStatusBean addContainer(ContainerBean containerBean);
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
}
