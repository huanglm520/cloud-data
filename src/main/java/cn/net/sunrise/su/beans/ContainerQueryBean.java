package cn.net.sunrise.su.beans;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import cn.net.sunrise.su.tool.IpTool;

public class ContainerQueryBean extends BaseBean implements Serializable, Cloneable {
	
	private static ThreadLocal<SimpleDateFormat> formater = new ThreadLocal<>();

	private static final long serialVersionUID = -1313620707375095745L;
	
	private long id;
	private int cid;
	private int uid;
	private String ip;
	private transient long querytime;
	private String time;
	private String querytype;
	
	public ContainerQueryBean() {
		
	}
	
	@Override
	public ContainerQueryBean clone() {
		ContainerQueryBean bean = new ContainerQueryBean();
		bean.id = id;
		bean.cid = cid;
		bean.uid = uid;
		bean.ip = ip;
		bean.querytime = querytime;
		bean.time = time;
		bean.querytype = querytype;
		return bean;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cid;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((ip == null) ? 0 : ip.hashCode());
		result = prime * result + ((querytype == null) ? 0 : querytype.hashCode());
		result = prime * result + ((time == null) ? 0 : time.hashCode());
		result = prime * result + uid;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ContainerQueryBean other = (ContainerQueryBean) obj;
		if (cid != other.cid)
			return false;
		if (id != other.id)
			return false;
		if (ip == null) {
			if (other.ip != null)
				return false;
		} else if (!ip.equals(other.ip))
			return false;
		if (querytype == null) {
			if (other.querytype != null)
				return false;
		} else if (!querytype.equals(other.querytype))
			return false;
		if (time == null) {
			if (other.time != null)
				return false;
		} else if (!time.equals(other.time))
			return false;
		if (uid != other.uid)
			return false;
		return true;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public long getQuerytime() {
		return querytime;
	}

	public void setQuerytime(long querytime) {
		this.querytime = querytime;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getQuerytype() {
		return querytype;
	}

	public void setQuerytype(String querytype) {
		this.querytype = querytype;
	}
	
	public void encode() {
		ip = BaseBean.base64EncodeString(ip);
	}
	public void decode() {
		ip = BaseBean.base64DecodeString(ip);
		if (ip != null) {
			ip = IpTool.IpAnonymous(ip);
		}
		SimpleDateFormat sdf = formater.get();
		if (sdf == null) {
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			formater.set(sdf);
		}
		time = sdf.format(new Date(querytime));
	}
}
