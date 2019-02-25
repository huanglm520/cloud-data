package cn.net.sunrise.su.dao;

import java.util.List;

import cn.net.sunrise.su.beans.ContainerQueryBean;
import cn.net.sunrise.su.beans.ContainerQueryResultBean;
import cn.net.sunrise.su.beans.ContainerQueryTimeBean;

public interface ContainerQueryStatisticsDao {

	public void insertQueryRecord(ContainerQueryBean containerQueryBean);
	public List<ContainerQueryResultBean> selectQueryRecord(ContainerQueryTimeBean containerQueryTimeBean);
}
