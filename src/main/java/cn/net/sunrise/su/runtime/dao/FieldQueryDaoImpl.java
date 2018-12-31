package cn.net.sunrise.su.runtime.dao;

import org.springframework.stereotype.Repository;

import cn.net.sunrise.su.beans.container.FieldBean;
import cn.net.sunrise.su.dao.BaseDao;
import cn.net.sunrise.su.dao.FieldQueryDao;

@Repository
public class FieldQueryDaoImpl extends BaseDao implements FieldQueryDao {

	public FieldQueryDaoImpl() {
		super("cn.net.sunrise.su.config.mapper.field-mapper.xml.");
	}

	@Override
	public void insertField(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		super.insert("insertField", fieldBean);
	}

	@Override
	public boolean existsField(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		return super.selectOne("existsField", fieldBean) != null;
	}

	@Override
	public void deleteField(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		super.delete("deleteField", fieldBean);
	}

	@Override
	public void deleteFieldByCid(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		super.delete("deleteFieldByCid", fieldBean);
	}
}
