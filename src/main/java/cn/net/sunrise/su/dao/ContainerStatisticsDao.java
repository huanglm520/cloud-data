package cn.net.sunrise.su.dao;

import java.util.List;

import cn.net.sunrise.su.beans.ContainerQueryBean;
import cn.net.sunrise.su.beans.ContainerQueryTimeBean;

public interface ContainerStatisticsDao {

	public void insertQueryRecord(ContainerQueryBean containerQueryBean);
	public List<ContainerQueryBean> selectQueryRecord(ContainerQueryTimeBean containerQueryTimeBean);
}
