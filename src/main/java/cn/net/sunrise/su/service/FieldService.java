package cn.net.sunrise.su.service;

import java.util.List;

import cn.net.sunrise.su.beans.FieldBean;
import cn.net.sunrise.su.enums.FieldKey;

public interface FieldService {

	public FieldKey addField(FieldBean fieldBean);
	public void deleteField(FieldBean fieldBean);
	public void deleteFieldByCid(FieldBean fieldBean);
	public boolean existsField(FieldBean fieldBean);
	public List<FieldBean> selectFieldByCid(FieldBean fieldBean);
	public List<FieldBean> selectFieldById(FieldBean fieldBean);
	public void updateFidle(FieldBean fieldBean);
}
