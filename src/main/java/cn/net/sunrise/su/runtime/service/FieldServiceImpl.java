package cn.net.sunrise.su.runtime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.net.sunrise.su.beans.FieldBean;
import cn.net.sunrise.su.dao.FieldQueryDao;
import cn.net.sunrise.su.enums.FieldKey;
import cn.net.sunrise.su.service.FieldService;

@Service
public class FieldServiceImpl implements FieldService {

	@Autowired
	private FieldQueryDao fieldQuerDao;
	
	@Override
	public FieldKey addField(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		if (this.fieldQuerDao.existsField(fieldBean)) {
			return FieldKey.FIELD_NAME_ALREADY_EXISTS;
		}
		this.fieldQuerDao.insertField(fieldBean);
		return FieldKey.OK;
	}

	@Override
	public void deleteField(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		this.fieldQuerDao.deleteField(fieldBean);
	}

	@Override
	public void deleteFieldByCid(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		this.fieldQuerDao.deleteFieldByCid(fieldBean);
	}

	@Override
	public boolean existsField(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		return this.fieldQuerDao.existsField(fieldBean);
	}

	@Override
	public List<FieldBean> selectFieldByCid(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		return this.fieldQuerDao.selectFieldByCid(fieldBean);
	}

	@Override
	public List<FieldBean> selectFieldById(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		return this.fieldQuerDao.selectFieldById(fieldBean);
	}

	@Override
	public void updateFidle(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		this.fieldQuerDao.updateField(fieldBean);
	}

}
