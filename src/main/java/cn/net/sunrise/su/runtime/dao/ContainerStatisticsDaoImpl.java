package cn.net.sunrise.su.runtime.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.net.sunrise.su.beans.ContainerQueryBean;
import cn.net.sunrise.su.beans.ContainerQueryTimeBean;
import cn.net.sunrise.su.dao.BaseDao;
import cn.net.sunrise.su.dao.ContainerStatisticsDao;

@Repository
public class ContainerStatisticsDaoImpl extends BaseDao implements ContainerStatisticsDao {
	
	public ContainerStatisticsDaoImpl() {
		// TODO Auto-generated constructor stub
		super("cn.net.sunrise.su.config.mapper.container-query-mapper.xml.");
	}

	@Override
	public void insertQueryRecord(ContainerQueryBean containerQueryBean) {
		// TODO Auto-generated method stub
		super.insert("insertQueryRecord", containerQueryBean);
	}

	@Override
	public List<ContainerQueryBean> selectQueryRecord(ContainerQueryTimeBean containerQueryTimeBean) {
		// TODO Auto-generated method stub
		return super.select("selectQueryRecord", containerQueryTimeBean);
	}

}
