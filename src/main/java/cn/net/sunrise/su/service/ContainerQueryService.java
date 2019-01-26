package cn.net.sunrise.su.service;

import java.util.Map;

import cn.net.sunrise.su.beans.container.ContainerBean;

public interface ContainerQueryService {

	public Map<String, Object> queryByCSQL(String csql, ContainerBean containerBean);
}
