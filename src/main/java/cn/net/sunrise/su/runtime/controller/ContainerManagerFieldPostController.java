package cn.net.sunrise.su.runtime.controller;

import java.util.List;

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
	
	@PostMapping("/add/")
	public Object add(@RequestParam("fieldname") String fname, 
					  @RequestParam("fieldtype") String type,
					  @RequestParam("fieldlen") String length,
					  @RequestParam("allownull") String isnull,
					  @RequestParam("fieldkey") String key,
					  @RequestParam(value="defaultdata", defaultValue=FieldBean.NULL_DEFAULT) String defaultdata,
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
		
		if (type==null || !type.matches("[1-9]")) {
			return FieldKey.SERVER_EXCEPTION;
		}
		if (key==null || !key.matches("0|1|2")) {
			return FieldKey.SERVER_EXCEPTION;
		}
		if (isnull==null || !isnull.matches("0|1")) {
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
		fieldBean.setName(fname);
		fieldBean.setCid(Integer.parseInt(cid));
		fieldBean.setIsnull(Integer.parseInt(isnull));
		fieldBean.setKey(Integer.parseInt(key));
		if (type.matches("7|8")) {
			if (length!=null && length.length()!=0 && length.matches("[0-9]{1,3}") && Integer.parseInt(length)<=255) {
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
		fieldBean.encode();
		if (this.fieldService.existsField(fieldBean)) {
			return FieldKey.FIELD_NAME_ALREADY_EXISTS;
		}
		fieldBean.decode();
		containerBean = this.containerService.selectContainer(containerBean).get(0);
		
		// 写入容器记录和实体
		this.containerService.addContainerField(containerBean, fieldBean);
		fieldBean.encode();
		this.fieldService.addField(fieldBean);
		this.containerService.plusOneField(containerBean);
		
		return FieldKey.OK;
	}
	
	@PostMapping("/modify/")
	public Object modify(@RequestParam("fieldname") String fname, 
					  @RequestParam("fieldtype") String type,
					  @RequestParam("fieldlen") String length,
					  @RequestParam("allownull") String isnull,
					  @RequestParam("fieldkey") String key,
					  @RequestParam(value="defaultdata", defaultValue=FieldBean.NULL_DEFAULT) String defaultdata,
					  @RequestParam("fid") String fid,
					  HttpSession session) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		
		if (fid==null || !AppCheck.checkId(fid)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		
		if (fname==null || fname.length() == 0) {
			return FieldKey.FIELD_NAME_EMPTY;
		}
		
		if (!FieldCheck.checkFieldName(fname)) {
			return FieldKey.FIELD_NAME_NOT_ACCEPT;
		}
		
		if (type==null || !type.matches("[1-9]")) {
			return FieldKey.SERVER_EXCEPTION;
		}
		if (key==null || !key.matches("0|1|2")) {
			return FieldKey.SERVER_EXCEPTION;
		}
		if (isnull==null || !isnull.matches("0|1")) {
			return FieldKey.SERVER_EXCEPTION;
		}
		
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		
		FieldBean fieldBean = new FieldBean();
		fieldBean.setId(Integer.parseInt(fid));
		List<FieldBean> list = this.fieldService.selectFieldById(fieldBean);
		
		if (list==null || list.isEmpty()) {
			return FieldKey.FIELD_NOT_EXISTS;
		}
		
		fieldBean = list.get(0);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setId(fieldBean.getCid());
		containerBean.setUid(userBean.getId());
		if (!this.containerService.hasPrivilege(containerBean)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		containerBean = this.containerService.selectContainerById(containerBean).get(0);
		
		// 标记变量，判断字段名是否修改
		boolean isChange = false;
		fieldBean.decode();
		if (!fieldBean.getName().equals(fname)) {
			isChange = true;
			fieldBean.setName(fname);
		}
		fieldBean.setIsnull(Integer.parseInt(isnull));
		fieldBean.setKey(Integer.parseInt(key));
		if (type.matches("7|8")) {
			if (length!=null && length.length()!=0 && length.matches("[0-9]{1,3}") && Integer.parseInt(length)<=255) {
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
		
		// 如果字段名修改了，需要判断是否冲突
		if (isChange) {
			fieldBean.encode();
			if (this.fieldService.existsField(fieldBean)) {
				return FieldKey.FIELD_NAME_ALREADY_EXISTS;
			}
			fieldBean.decode();
		}
		// 修改容器记录和实体
		this.containerService.updateContainerField(containerBean, fieldBean);
		fieldBean.encode();
		this.fieldService.updateFidle(fieldBean);
		
		return FieldKey.OK;
	}
	
	@PostMapping("/delete/")
	public Object delete(@RequestParam("name") String name, @RequestParam("fid") String fid, HttpSession session) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		if (fid==null || !AppCheck.checkId(fid)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		
		FieldBean fieldBean = new FieldBean();
		fieldBean.setId(Integer.parseInt(fid));
		
		List<FieldBean> list = this.fieldService.selectFieldById(fieldBean);
		if (list==null || list.isEmpty()) {
			return ContainerKey.NO_PRIVILEGE;
		}
		
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		fieldBean = list.get(0);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setId(fieldBean.getCid());
		containerBean.setUid(userBean.getId());
		if (!this.containerService.hasPrivilege(containerBean)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		
		containerBean = this.containerService.selectContainerById(containerBean).get(0);
		
		fieldBean.decode();
		if (!(containerBean.getName()+":"+fieldBean.getName()).equals(name)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		
		// 清理字段记录值
		
		this.containerService.deleteContainerField(containerBean, fieldBean);
		this.containerService.subOneField(containerBean);
		this.fieldService.deleteField(fieldBean);
		
		return FieldKey.OK;
 	}
}
