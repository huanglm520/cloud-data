package cn.net.sunrise.su.service;

import java.util.List;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.ContainerNewBean;
import cn.net.sunrise.su.beans.container.ContainerPrivilegeBean;
import cn.net.sunrise.su.beans.container.ContainerStatisticsBean;
import cn.net.sunrise.su.beans.container.ContainerStatusBean;
import cn.net.sunrise.su.beans.container.FieldBean;

public interface ContainerService {

	public ContainerStatusBean addContainer(ContainerBean containerBean);
	public List<ContainerStatisticsBean> selectContainerStatistics(ContainerBean containerBean);
	public List<ContainerBean> selectContainer(ContainerBean containerBean);
	public List<ContainerBean> selectContainerById(ContainerBean containerBean);
	public List<ContainerPrivilegeBean> selectPrivilegeByCid(ContainerPrivilegeBean containerPrivilegeBean);
	public boolean hasPrivilege(ContainerBean containerBean);
	public List<FieldBean> queryContainerStruct(ContainerNewBean containerNewBean);
}
