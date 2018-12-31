package cn.net.sunrise.su.dao;

import cn.net.sunrise.su.beans.container.FieldBean;

public interface FieldQueryDao {

	public void insertField(FieldBean fieldBean);
	public boolean existsField(FieldBean fieldBean);
	public void deleteField(FieldBean fieldBean);
	public void deleteFieldByCid(FieldBean fieldBean);
}
