package cn.net.sunrise.su.runtime.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.ContainerNewBean;
import cn.net.sunrise.su.beans.container.ContainerStatisticsBean;
import cn.net.sunrise.su.dao.BaseDao;
import cn.net.sunrise.su.dao.ContainerQueryDao;

@Repository
public class ContainerQueryDaoImpl extends BaseDao implements ContainerQueryDao {
	
	public ContainerQueryDaoImpl() {
		// TODO Auto-generated constructor stub
		super("cn.net.sunrise.su.config.mapper.container-mapper.xml.");
	}
	
	@Override
	public void insertContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		super.insert("insertContainer", containerBean);
	}

	@Override
	public void updateContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		super.update("updateContainer", containerBean);
	}

	@Override
	public void deleteContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		super.delete("deleteContainer", containerBean);
	}
	
	@Override
	public List<ContainerBean> selectContainerById(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return super.select("selectContainerById", containerBean);
	}
	
	@Override
	public List<ContainerBean> selectContainerByUid(ContainerBean containerBean) {
		return super.select("selectContainerByUid", containerBean);
	}

	@Override
	public List<ContainerBean> selectContainerByStatus(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return super.select("selectContainerByStatus", containerBean);
	}

	@Override
	public List<ContainerBean> selectContainerByName(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		containerBean.setName("%%"+containerBean.getName()+"%%");
		return super.select("selectContainerByName", containerBean);
	}

	@Override
	public List<ContainerBean> selectContainerByPrivilege(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return super.select("selectContainerByPrivilege", containerBean);
	}

	@Override
	public List<ContainerBean> selectContainerByStatusName(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		containerBean.setName("%%"+containerBean.getName()+"%%");
		return super.select("selectContainerByStatusName", containerBean);
	}

	@Override
	public List<ContainerBean> selectContainerByStatusPrivilege(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return super.select("selectContainerByStatusPrivilege", containerBean);
	}

	@Override
	public List<ContainerBean> selectContainerByNamePrivilege(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		containerBean.setName("%%"+containerBean.getName()+"%%");
		return super.select("selectContainerByNamePrivilege", containerBean);
	}

	@Override
	public List<ContainerBean> selectContainerByStatusNamePrivilege(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		containerBean.setName("%%"+containerBean.getName()+"%%");
		return super.select("selectContainerByStatusNamePrivilege", containerBean);
	}

	@Override
	public boolean existsContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return super.selectOne("existsContainer", containerBean) != null;
	}

	@Override
	public boolean existsApi(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return super.selectOne("existsApi", containerBean) != null;
	}
	
	@Override
	public List<ContainerStatisticsBean> selectStatistics(ContainerBean containerBean) {
		return super.select("selectStatistics", containerBean);
	}

	@Override
	public void createContainerSpace(ContainerNewBean containerNewBean) {
		// TODO Auto-generated method stub
		super.update("createContainerSpace", containerNewBean);
	}

	@Override
	public void dropContainerSpace(ContainerNewBean containerNewBean) {
		// TODO Auto-generated method stub
		super.update("dropContainerSpace", containerNewBean);
	}

	@Override
	public boolean hasPrivilege(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return super.selectOne("hasPrivilege", containerBean) != null;
	}

	@Override
	public boolean isOwner(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return super.selectOne("isOwner", containerBean) != null;
	}

	@Override
	public void containerField(ContainerNewBean containerNewBean) {
		// TODO Auto-generated method stub
		super.update("containerField", containerNewBean);
	}

	@Override
	public void plusOneField(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		super.update("plusOneField", containerBean);
	}

	@Override
	public void subOneField(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		super.update("subOneField", containerBean);
	}

}
