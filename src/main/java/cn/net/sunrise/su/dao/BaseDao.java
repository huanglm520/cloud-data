package cn.net.sunrise.su.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseDao {
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	private final String NAMESPACE;
	
	protected BaseDao() {
		this.NAMESPACE = "";
	}
	
	protected BaseDao(String namespace) {
		this.NAMESPACE = namespace;
	}

	protected <E> List<E> select(String statement, Object object) {
		List<E> list = null;
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		list = sqlSession.selectList(NAMESPACE+statement, object);
		sqlSession.close();
		return list;
	}
	
	protected int insert(String statement, Object object) {
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		int r = sqlSession.insert(NAMESPACE+statement, object);
		sqlSession.close();
		return r;
	}
	
	protected int update(String statement, Object object) {
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		int r = sqlSession.update(NAMESPACE+statement, object);
		sqlSession.close();
		return r;
	}
	
	protected int delete(String statement, Object object) {
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		int r = sqlSession.delete(NAMESPACE+statement, object);
		sqlSession.close();
		return r;
	}
	
	protected Object selectOne(String statement, Object object) {
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		Object object1 = sqlSession.selectOne(NAMESPACE+statement, object);
		sqlSession.close();
		return object1;
	}
}
