package cn.net.sunrise.su.runtime.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.net.sunrise.su.beans.ContainerBean;
import cn.net.sunrise.su.runtime.dao.DboDao;
import cn.net.sunrise.su.service.ContainerQueryService;
import cn.net.sunrise.su.tool.ResultBody;

@Service
public class ContainerQueryServiceImpl implements ContainerQueryService {
	
	@Autowired
	private DboDao dao;

	@Override
	public Map<String, Object> queryByCSQL(String csql, ContainerBean containerBean) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		if (csql.matches("select[\\S\\s]*\\$this;[\\S\\s]*")) {
			map = new HashMap<>();
			try {
				// 替换第一个$this;后查询
				List<Map<String, Object>> result = dao.querySql(csql.replaceFirst("\\$this;", "`"+containerBean.tableName()+"`"));
				map.put("code", 0);
				map.put("line", result.size());
				map.put("type", "select");
				if (!result.isEmpty()) {
					@SuppressWarnings("unchecked")
					List<String> cols = (List<String>) result.get(0).get("cols");
					map.put("cols", cols);
					result.forEach(ContainerQueryServiceImpl::removeColList);
				}
				map.put("table", ResultBody.gson.toJson(result));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				map.put("code", 1);
				map.put("errorcode", e.getErrorCode());
				map.put("message", e.getMessage());
			}
		} else if (csql.matches("update[\\S\\s]*\\$this;[\\S\\s]*") ||
				   csql.matches("insert[\\S\\s]*\\$this;[\\S\\s]*") ||
				   csql.matches("delete[\\S\\s]*\\$this;[\\S\\s]*")) {
			map = new HashMap<>();
			try {
				int cnt = dao.updateSql(csql.replaceFirst("\\$this;", "`"+containerBean.tableName()+"`"));
				map.put("code", 0);
				map.put("line", cnt);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				map.put("code", 1);
				map.put("errorcode", e.getErrorCode());
				map.put("message", e.getMessage());
			}
		} else {
			map = new HashMap<>();
			map.put("code", 1);
			map.put("errorcode", -3);
			map.put("message", "Syntax error!");
		}
		return map;
	}
	
	private static void removeColList(Map<String, Object> map) {
		map.remove("cols");
	}

}
