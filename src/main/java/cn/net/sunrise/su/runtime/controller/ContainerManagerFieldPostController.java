package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.FieldBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.FieldKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.service.FieldService;
import cn.net.sunrise.su.tool.AppCheck;
import cn.net.sunrise.su.tool.FieldCheck;

@RestController
@RequestMapping(value="/container/manager/field", method=RequestMethod.POST)
public class ContainerManagerFieldPostController extends BaseController {
	
	@Autowired
	private FieldService fieldService;
	
	@Autowired
	private ContainerService containerService;
	
	@PostMapping("/add")
	public Object add(@RequestParam("fieldname") String fname, 
					  @RequestParam("fieldtype") String type,
					  @RequestParam("fieldlen") String length,
					  @RequestParam("allownull") String isnull,
					  @RequestParam("fieldkey") String key,
					  @RequestParam("defaultdata") String defaultdata,
					  @RequestParam("cid") String cid,
					  HttpSession session) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		
		if (cid==null || !AppCheck.checkId(cid)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		
		if (fname==null || fname.length() == 0) {
			return FieldKey.FIELD_NAME_EMPTY;
		}
		
		if (!FieldCheck.checkFieldName(fname)) {
			return FieldKey.FIELD_NAME_NOT_ACCEPT;
		}
		
		if (type==null || type.length()==0 ||
				!"0".equals(isnull) || !"1".equals(isnull) ||
				!"0".equals(key) || !"1".equals(key) || !"2".equals(key)) {
			return FieldKey.SERVER_EXCEPTION;
		}
		
		if (!type.matches("[1-9]")) {
			return FieldKey.SERVER_EXCEPTION;
		}
		
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		
		ContainerBean containerBean = new ContainerBean();
		containerBean.setId(Integer.parseInt(cid));
		containerBean.setUid(userBean.getId());
		if (!this.containerService.hasPrivilege(containerBean)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		
		FieldBean fieldBean = new FieldBean();
		fieldBean.setCid(Integer.parseInt(cid));
		fieldBean.setIsnull(Integer.parseInt(isnull));
		fieldBean.setKey(Integer.parseInt(key));
		if (type.matches("7|8")) {
			if (length!=null && length.length()!=0 && length.matches("[0-9]{1,6}") && Integer.parseInt(length)<=65536) {
				// 如果长度合法则按照用户指定长度
				fieldBean.setType(FieldBean.textTypeString(type, length));
			} else {
				// 否则使用默认长度
				fieldBean.setType(FieldBean.textTypeString(type, "255"));
			}
		} else {
			fieldBean.setType(type);
		}
		
		fieldBean.setDefaultdata(defaultdata==null || defaultdata.length()==0 ? FieldBean.NULL_DEFAULT : defaultdata);
		
		containerBean = this.containerService.selectContainer(containerBean).get(0);
		
		// 写入容器实体
		this.containerService.addContainerField(containerBean, fieldBean);
		
		fieldBean.encode();
		this.fieldService.addField(fieldBean);
		
		return FieldKey.OK;
	}
}
