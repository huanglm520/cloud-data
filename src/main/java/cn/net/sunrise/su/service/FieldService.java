package cn.net.sunrise.su.service;

import java.util.List;

import cn.net.sunrise.su.beans.container.FieldBean;
import cn.net.sunrise.su.beans.container.FieldStatusBean;

public interface FieldService {

	public FieldStatusBean addField(FieldBean fieldBean);
	public void deleteField(FieldBean fieldBean);
	public void deleteFieldByCid(FieldBean fieldBean);
	public boolean existsField(FieldBean fieldBean);
	public List<FieldBean> selectFieldByCid(FieldBean fieldBean);
}
