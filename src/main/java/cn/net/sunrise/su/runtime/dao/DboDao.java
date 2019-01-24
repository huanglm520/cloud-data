package cn.net.sunrise.su.runtime.dao;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class DboDao extends JdbcTemplate {
	
	@Autowired
	private static DataSource dataSource;
	
	private static final DboDao dboDao;
	static {
		dboDao = new DboDao();
	}
	
	private DboDao() { super(dataSource); }
	
	public static DboDao getInstance() {
		return dboDao;
	}
	
	public List<Map<String, Object>> querySql(String sql) throws SQLException {
		try {
			List<Map<String, Object>> list = super.query(sql, new RowMapper<Map<String, Object>>() {
	
				@Override
				public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
					// TODO Auto-generated method stub
					Map<String, Object> map = new ConcurrentHashMap<>();
					ResultSetMetaData data = rs.getMetaData();
					List<String> colList = Collections.synchronizedList(new ArrayList<>());
					int colNum = data.getColumnCount();
					for (int i=0; i<colNum; i++) {
						colList.add(data.getColumnName(i));
					}
					for (String s: colList) {
						map.put(s, rs.getObject(s));
					}
					return map;
				}
				
			});
			return list;
		} catch (DataAccessException exception) {
			throw new SQLException(exception);
		}
	}
	
	public int updateSql(String sql) throws SQLException {
		try {
			int cnt =  super.update(sql);
			return cnt;
		} catch (DataAccessException exception) {
			// TODO: handle exception
			throw new SQLException(exception);
		}
	}
}
