package cn.net.sunrise.su.dao;

import java.util.List;

import cn.net.sunrise.su.beans.FieldBean;

public interface FieldQueryDao {

	public void insertField(FieldBean fieldBean);
	public boolean existsField(FieldBean fieldBean);
	public void deleteField(FieldBean fieldBean);
	public void deleteFieldByCid(FieldBean fieldBean);
	public List<FieldBean> selectFieldByCid(FieldBean fieldBean);
	public List<FieldBean> selectFieldById(FieldBean fieldBean);
	public void updateField(FieldBean fieldBean);
}
