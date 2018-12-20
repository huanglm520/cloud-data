package cn.net.sunrise.su.runtime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.net.sunrise.su.beans.container.FieldBean;
import cn.net.sunrise.su.beans.container.FieldStatusBean;
import cn.net.sunrise.su.dao.FieldQueryDao;
import cn.net.sunrise.su.enums.FieldKey;
import cn.net.sunrise.su.service.FieldService;

@Service
public class FieldServiceImpl implements FieldService {

	@Autowired
	private FieldQueryDao fieldQuerDao;
	
	@Override
	public FieldStatusBean addField(FieldBean fieldBean) {
		// TODO Auto-generated method stub
		if (this.fieldQuerDao.existsField(fieldBean)) {
			return new FieldStatusBean(FieldKey.FIELD_NAME_ALREADY_EXISTS);
		}
		this.fieldQuerDao.insertField(fieldBean);
		return new FieldStatusBean(FieldKey.OK);
	}

}
