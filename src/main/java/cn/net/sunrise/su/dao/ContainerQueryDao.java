package cn.net.sunrise.su.dao;

import java.util.List;

import cn.net.sunrise.su.beans.ContainerBean;
import cn.net.sunrise.su.beans.ContainerNewBean;
import cn.net.sunrise.su.beans.ContainerStatisticsBean;

public interface ContainerQueryDao {

	public void insertContainer(ContainerBean containerBean);
	public void updateContainer(ContainerBean containerBean);
	public void deleteContainer(ContainerBean containerBean);
	public List<ContainerBean> selectContainerById(ContainerBean containerBean);
	public List<ContainerBean> selectContainerByUid(ContainerBean containerBean);
	public List<ContainerBean> selectContainerByStatus(ContainerBean containerBean);
	public List<ContainerBean> selectContainerByName(ContainerBean containerBean);
	public List<ContainerBean> selectContainerByPrivilege(ContainerBean containerBean);
	public List<ContainerBean> selectContainerByStatusName(ContainerBean containerBean);
	public List<ContainerBean> selectContainerByStatusPrivilege(ContainerBean containerBean);
	public List<ContainerBean> selectContainerByNamePrivilege(ContainerBean containerBean);
	public List<ContainerBean> selectContainerByStatusNamePrivilege(ContainerBean containerBean);
	public boolean existsContainer(ContainerBean containerBean);
	public boolean existsApi(ContainerBean containerBean);
	
	public List<ContainerStatisticsBean> selectStatistics(ContainerBean containerBean);
	
	public void createContainerSpace(ContainerNewBean containerNewBean);
	public void dropContainerSpace(ContainerNewBean containerNewBean);
	
	public Object hasPrivilege(ContainerBean containerBean);
	public Object isOwner(ContainerBean containerBean);
	
	public void containerField(ContainerNewBean containerNewBean);
	public void plusOneField(ContainerBean containerBean);
	public void subOneField(ContainerBean containerBean);
	public void lockContainer(ContainerBean containerBean);
	public void unlockContainer(ContainerBean containerBean);
	public int isLocked(ContainerBean containerBean);
	public Object hasGuest(ContainerBean containerBean);
	public int containerDataCount(ContainerNewBean containerNewBean);
}
