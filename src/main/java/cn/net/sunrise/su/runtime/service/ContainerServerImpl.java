package cn.net.sunrise.su.runtime.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.net.sunrise.su.beans.ContainerBean;
import cn.net.sunrise.su.beans.ContainerNewBean;
import cn.net.sunrise.su.beans.ContainerPrivilegeBean;
import cn.net.sunrise.su.beans.ContainerQueryBean;
import cn.net.sunrise.su.beans.ContainerQueryResultBean;
import cn.net.sunrise.su.beans.ContainerQueryTimeBean;
import cn.net.sunrise.su.beans.ContainerStatisticsBean;
import cn.net.sunrise.su.beans.FieldBean;
import cn.net.sunrise.su.dao.ContainerPrivilegeDao;
import cn.net.sunrise.su.dao.ContainerQueryDao;
import cn.net.sunrise.su.dao.ContainerQueryStatisticsDao;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.ContainerPrivilegeKey;
import cn.net.sunrise.su.enums.ContainerStatusKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.service.FieldService;
import cn.net.sunrise.su.tool.ResultBody;

@Service
public class ContainerServerImpl implements ContainerService {
	
	@Autowired
	private ContainerQueryDao containerQueryDao;
	@Autowired
	private ContainerPrivilegeDao containerPrivilegeDao;
	@Autowired
	private FieldService fieldService;
	@Autowired
	private ContainerQueryStatisticsDao containerStatisticsDao;

	@Override
	public Object addContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		
		if (containerQueryDao.existsContainer(containerBean)) {
			return ContainerKey.CONTAINER_NAME_ALREADY_EXISTS;
		}
		if (containerQueryDao.existsApi(containerBean)) {
			return ContainerKey.API_NAME_ALREADY_EXISTS;
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
		FieldBean fieldBean = FieldBean.DEFAULT_ID.clone();
		fieldBean.setCid(containerBean.getId());
		fieldBean.encode();
		fieldService.addField(fieldBean);
		// 创建容器空间
		containerQueryDao.createContainerSpace(new ContainerNewBean(containerBean.tableName()));
		
		Map<String, Object> map = new HashMap<>();
		map.put("code", ContainerKey.OK.code);
		map.put("message", ContainerKey.OK.message);
		map.put("cid", containerBean.getId());
		
		return ResultBody.gson.toJson(map);
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
		return this.containerQueryDao.hasPrivilege(containerBean) != null;
	}

	@Override
	public void updateContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		this.containerQueryDao.updateContainer(containerBean);
	}

	@Override
	public boolean isOwner(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return this.containerQueryDao.isOwner(containerBean) != null;
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
		this.fieldService.deleteFieldByCid(fieldBean);
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

	@Override
	public void addContainerField(ContainerBean containerBean, FieldBean fieldBean) {
		// TODO Auto-generated method stub
		// 解析字段
		StringBuffer sb = new StringBuffer();
		sb.append("`"+containerBean.tableName()+"` add column "+fieldBean.getName()+" ");
		String[] types = fieldBean.getType().split("\\+");
		switch (types[0]) {
			case FieldBean.BIT: {
				sb.append(" bit ");
				break;
			}
			case FieldBean.INT: {
				sb.append(" int ");
				break;
			}
			case FieldBean.BIGINT: {
				sb.append(" bigint ");
				break;
			}
			case FieldBean.FLOAT: {
				sb.append(" float ");
				break;
			}
			case FieldBean.DOUBLE: {
				sb.append(" double ");
				break;
			}
			case FieldBean.DECIMAL: {
				sb.append(" decimal ");
				break;
			}
			case FieldBean.CHAR: {
				sb.append(String.format(" char(%s) ", types[1]));
				break;
			}
			case FieldBean.VARCHAR: {
				sb.append(String.format(" varchar(%s) ", types[1]));
				break;
			}
			case FieldBean.LONGTEXT: {
				sb.append(" longtext ");
				break;
			}
		}
		
		switch (fieldBean.getKey()) {
			case 0: {
				sb.append(" primary key ");
				break;
			}
			case 1: {
				sb.append(" unique key ");
				break;
			}
		}
		
		if (fieldBean.getIsnull() == FieldBean.PROHIBIT_NULL) {
			sb.append(" not null ");
		}
		
		if (fieldBean.getDefaultdata()!=null && !fieldBean.getDefaultdata().equals(FieldBean.NULL_DEFAULT)) {
			sb.append(String.format(" default '%s' ", fieldBean.getDefaultdata()));
		}
		
		ContainerNewBean containerNewBean = new ContainerNewBean();
		containerNewBean.setTablename(sb.toString());
		this.containerQueryDao.containerField(containerNewBean);
	}

	@Override
	public void plusOneField(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		this.containerQueryDao.plusOneField(containerBean);
	}

	@Override
	public void updateContainerField(ContainerBean containerBean, FieldBean fieldBean) {
		// TODO Auto-generated method stub
		// 解析字段
		StringBuffer sb = new StringBuffer();
		sb.append("`"+containerBean.tableName()+"` modify "+fieldBean.getName()+" ");
		String[] types = fieldBean.getType().split("\\+");
		switch (types[0]) {
			case FieldBean.BIT: {
				sb.append(" bit ");
				break;
			}
			case FieldBean.INT: {
				sb.append(" int ");
				break;
			}
			case FieldBean.BIGINT: {
				sb.append(" bigint ");
				break;
			}
			case FieldBean.FLOAT: {
				sb.append(" float ");
				break;
			}
			case FieldBean.DOUBLE: {
				sb.append(" double ");
				break;
			}
			case FieldBean.DECIMAL: {
				sb.append(" decimal ");
				break;
			}
			case FieldBean.CHAR: {
				sb.append(String.format(" char(%s) ", types[1]));
				break;
			}
			case FieldBean.VARCHAR: {
				sb.append(String.format(" varchar(%s) ", types[1]));
				break;
			}
			case FieldBean.LONGTEXT: {
				sb.append(" longtext ");
				break;
			}
		}
		
//		switch (fieldBean.getKey()) {
//			case 0: {
//				sb.append(" primary key ");
//				break;
//			}
//			case 1: {
//				sb.append(" unique key ");
//				break;
//			}
//		}
		
		if (fieldBean.getIsnull() == FieldBean.PROHIBIT_NULL) {
			sb.append(" not null ");
		}
		
		if (fieldBean.getDefaultdata()!=null && !fieldBean.getDefaultdata().equals(FieldBean.NULL_DEFAULT)) {
			sb.append(String.format(" default '%s' ", fieldBean.getDefaultdata()));
		}
		
		ContainerNewBean containerNewBean = new ContainerNewBean();
		containerNewBean.setTablename(sb.toString());
		this.containerQueryDao.containerField(containerNewBean);
	}

	@Override
	public void deleteContainerField(ContainerBean containerBean, FieldBean fieldBean) {
		// TODO Auto-generated method stub
		ContainerNewBean containerNewBean = new ContainerNewBean();
		containerNewBean.setTablename("`"+containerBean.tableName()+"` drop column "+fieldBean.getName());
		this.containerQueryDao.containerField(containerNewBean);
	}

	@Override
	public void subOneField(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		this.containerQueryDao.subOneField(containerBean);
	}

	@Override
	public void lockContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		this.containerQueryDao.lockContainer(containerBean);
	}

	@Override
	public void unlockContainer(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		this.containerQueryDao.unlockContainer(containerBean);
	}

	@Override
	public boolean isLocked(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return this.containerQueryDao.isLocked(containerBean) == 1;
	}

	@Override
	public boolean hasGuest(ContainerBean containerBean) {
		// TODO Auto-generated method stub
		return this.containerQueryDao.hasGuest(containerBean) != null;
	}

	@Override
	public int containerDataCount(ContainerNewBean containerNewBean) {
		// TODO Auto-generated method stub
		return this.containerQueryDao.containerDataCount(containerNewBean);
	}

	@Override
	public void insertQueryRecord(ContainerQueryBean containerQueryBean) {
		// TODO Auto-generated method stub
		containerQueryBean.encode();
		this.containerStatisticsDao.insertQueryRecord(containerQueryBean);
	}

	/**
	 * 此方法直接封装前端所需的JSON结构
	 * 应用HashMap实现
	 */
	@Override
	public Object selectQueryRecord(ContainerQueryTimeBean containerQueryTimeBean) {
		// TODO Auto-generated method stub
		List<ContainerQueryResultBean> list = this.containerStatisticsDao.selectQueryRecord(containerQueryTimeBean);
		Set<String> legend = new HashSet<>();
		List<String> xAxis = new ArrayList<>();
		Map<String, Map<String, Long>> map = new HashMap<>();
		// 利用HashMap做容器名称缓存
		Map<Integer, String> cnameCache = new HashMap<>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(containerQueryTimeBean.getLeftTime());
		
		// 写入日期序列
		while (date.getTime() <= containerQueryTimeBean.getRightTime()) {
			xAxis.add(sdf.format(date));
			date.setTime(date.getTime()+24*60*60*1000L);
		}
		
		for (ContainerQueryResultBean bean : list) {
			// 获取容器名称
			String cname = cnameCache.get(bean.getCid());
			if (cname == null) {
				// 如果不存在去数据库中查询
				ContainerBean containerBean = new ContainerBean();
				containerBean.setId(bean.getCid());
				containerBean = this.containerQueryDao.selectContainerById(containerBean).get(0);
				cname = containerBean.getName();
				cnameCache.put(bean.getCid(), cname);
			}
			legend.add(cname);
			
			Map<String, Long> m = map.get(cname);
			if (m == null) {
				m = new HashMap<>();
				map.put(cname, m);
			}
			String tFormat = bean.getDate();
			Long cnt = m.get(tFormat);
			if (cnt == null) {
				cnt = 0L;
			}
			cnt += bean.getTotal() ;
			m.put(tFormat, cnt);
		}
		List<Map<String, Object>> series = new ArrayList<>();
		for (String key: legend) {
			Map<String, Object> tm = new HashMap<>();
			tm.put("name", key);
			tm.put("type", "line");
			List<Long> dataList = new ArrayList<>();
			for (String string : xAxis) {
				Long long1 = map.get(key).get(string);
				dataList.add(long1==null ? 0 : long1);
			}
			tm.put("data", dataList);
			series.add(tm);
		}
		Map<String, Object> result = new HashMap<>();
		result.put("legend", legend);
		result.put("xAxis", xAxis);
		result.put("series", series);
		return result;
	}

}
