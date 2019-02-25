package cn.net.sunrise.su.beans;

import java.io.Serializable;

public class ContainerQueryResultBean extends BaseBean implements Serializable, Cloneable {

	private static final long serialVersionUID = -6629304227570017981L;

	private long total;
	private String date;
	private int cid;
	
	public ContainerQueryResultBean() {
		
	}
	
	@Override
	public ContainerQueryResultBean clone() {
		return (ContainerQueryResultBean) super.clone();
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cid;
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + (int) (total ^ (total >>> 32));
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
		ContainerQueryResultBean other = (ContainerQueryResultBean) obj;
		if (cid != other.cid)
			return false;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (total != other.total)
			return false;
		return true;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
	
}
