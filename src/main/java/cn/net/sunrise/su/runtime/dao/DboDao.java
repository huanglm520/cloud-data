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
import org.springframework.stereotype.Repository;

@Repository
public class DboDao {
	
	private DataSource dataSource;
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public DboDao(DataSource dataSource) {
		setDataSource(dataSource);
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}
	
	public List<Map<String, Object>> querySql(String sql) throws SQLException {
		try {
			List<Map<String, Object>> list = jdbcTemplate.query(sql, new RowMapper<Map<String, Object>>() {
	
				@Override
				public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
					// TODO Auto-generated method stub
					Map<String, Object> map = new ConcurrentHashMap<>();
					ResultSetMetaData data = rs.getMetaData();
					List<String> colList = Collections.synchronizedList(new ArrayList<>());
					int colNum = data.getColumnCount();
					for (int i=1; i<=colNum; i++) {
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
			int cnt =  jdbcTemplate.update(sql);
			return cnt;
		} catch (DataAccessException exception) {
			// TODO: handle exception
			throw new SQLException(exception);
		}
	}
}
