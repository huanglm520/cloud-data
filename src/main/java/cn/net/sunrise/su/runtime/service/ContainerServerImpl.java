package cn.net.sunrise.su.runtime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.ContainerNewBean;
import cn.net.sunrise.su.beans.container.ContainerPrivilegeBean;
import cn.net.sunrise.su.beans.container.ContainerStatisticsBean;
import cn.net.sunrise.su.beans.container.ContainerStatusBean;
import cn.net.sunrise.su.beans.container.FieldBean;
import cn.net.sunrise.su.dao.ContainerPrivilegeDao;
import cn.net.sunrise.su.dao.ContainerQueryDao;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.ContainerPrivilegeKey;
import cn.net.sunrise.su.enums.ContainerStatusKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.service.FieldService;

@Service
public class ContainerServerImpl implements ContainerService {
	
	@Autowired
	private ContainerQueryDao containerQueryDao;
	@Autowired
	private ContainerPrivilegeDao containerPrivilegeDao;
	@Autowired
	private FieldService fs;

	@Override
	public ContainerStatusBean addContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		
		if (containerQueryDao.existsContainer(containerBean)) {
			return new ContainerStatusBean(ContainerKey.CONTAINER_NAME_ALREADY_EXISTS);
		}
		if (containerQueryDao.existsApi(containerBean)) {
			return new ContainerStatusBean(ContainerKey.API_NAME_ALREADY_EXISTS);
		}
		
		// 写入容器数据
		containerBean.setData(0);
		containerBean.setField(1);
		containerBean.setStatus(ContainerStatusKey.CREATING.key);
		containerBean.setBuildtime(System.currentTimeMillis());
		containerQueryDao.insertContainer(containerBean);
		// 设置容器权限
		ContainerPrivilegeBean containerPrivilegeBean = new ContainerPrivilegeBean();
		containerPrivilegeBean.setCid(containerBean.getId());
		containerPrivilegeBean.setUid(containerBean.getUid());
		containerPrivilegeBean.setPrivilege(ContainerPrivilegeKey.OWNER.key);
		containerPrivilegeDao.insertPrivilegeByUid(containerPrivilegeBean);
		// 写入容器初始字段
		FieldBean fieldBean = new FieldBean(FieldBean.DEFAULT_ID);
		fieldBean.setCid(containerBean.getId());
		fieldBean.encode();
		fs.addField(fieldBean);
		// 创建容器空间
		containerQueryDao.createContainerSpace(new ContainerNewBean(containerBean.tableName()));
		
		return new ContainerStatusBean(ContainerKey.OK.code, ContainerKey.OK.message, containerBean.getId());
	}

	@Override
	public List<ContainerStatisticsBean> selectContainerStatistics(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return this.containerQueryDao.selectStatistics(containerBean);
	}
	
	@Override
	public List<ContainerBean> selectContainer(ContainerBean containerBean) {
		List<ContainerBean> list = null;
		if (containerBean.getId() != -1) {
			return this.containerQueryDao.selectContainerById(containerBean);
		}
		if (containerBean.getStatus()!=-1 && containerBean.getPrivilege()!=-1) {
			list = this.containerQueryDao.selectContainerByStatusNamePrivilege(containerBean);
		} else if (containerBean.getStatus() != -1) {
			list = this.containerQueryDao.selectContainerByStatusName(containerBean);
		} else if (containerBean.getPrivilege() != -1) {
			list = this.containerQueryDao.selectContainerByNamePrivilege(containerBean);
		} else {
			list = this.containerQueryDao.selectContainerByName(containerBean);
		}
		for (ContainerBean c: list) {
			ContainerPrivilegeBean containerPrivilegeBean = new ContainerPrivilegeBean();
			containerPrivilegeBean.setUid(containerBean.getUid());
			containerPrivilegeBean.setCid(c.getId());
			c.setPrivilege(this.containerPrivilegeDao.selectPrivilegeByCidUid(containerPrivilegeBean).get(0).getPrivilege());
		}
		return list;
	}
	
	@Override
	public List<ContainerBean> selectContainerById(ContainerBean containerBean) {
		return this.containerQueryDao.selectContainerById(containerBean);
	}
	
	@Override
	public List<ContainerPrivilegeBean> selectPrivilegeByCid(ContainerPrivilegeBean containerPrivilegeBean) {
		return this.containerPrivilegeDao.selectPrivilegeByCid(containerPrivilegeBean);
	}

	@Override
	public boolean hasPrivilege(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return this.containerQueryDao.hasPrivilege(containerBean);
	}

	@Override
	public void updateContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		this.containerQueryDao.updateContainer(containerBean);
	}

	@Override
	public boolean isOwner(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return this.containerQueryDao.isOwner(containerBean);
	}

	@Override
	public void dropContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		// 删除容器记录
		this.containerQueryDao.deleteContainer(containerBean);
		// 删除容器权限
		ContainerPrivilegeBean containerPrivilegeBean = new ContainerPrivilegeBean();
		containerPrivilegeBean.setCid(containerBean.getId());
		this.containerPrivilegeDao.deletePrivilegeByCid(containerPrivilegeBean);
		// 删除容器字段
		FieldBean fieldBean = new FieldBean();
		fieldBean.setCid(containerBean.getId());
		this.fs.deleteFieldByCid(fieldBean);
		// 删除容器空间
		ContainerNewBean containerNewBean = new ContainerNewBean();
		containerNewBean.setTablename(containerBean.tableName());
		this.containerQueryDao.dropContainerSpace(containerNewBean);
	}

	@Override
	public boolean existsPrivilege(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		return this.containerPrivilegeDao.existsPrivilege(containerPrivilegeBean);
	}

	@Override
	public void addPrivilege(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		this.containerPrivilegeDao.insertPrivilegeByUid(containerPrivilegeBean);
	}

	@Override
	public List<ContainerPrivilegeBean> selectPrivilegeById(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		return this.containerPrivilegeDao.selectPrivilegeById(containerPrivilegeBean);
	}

	@Override
	public void deletePrivilegeById(ContainerPrivilegeBean containerPrivilegeBean) {
		// TODO Auto-generated method stub
		this.containerPrivilegeDao.deletePrivilegeById(containerPrivilegeBean);
	}

}
