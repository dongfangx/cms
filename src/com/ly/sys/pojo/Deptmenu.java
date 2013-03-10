package com.ly.sys.pojo;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("deptmenu")
public class Deptmenu {

	@Name
	@Column
	private String deptmenuid;

	@Column
	private String menuid;

	@Column
	private String deptid;

	public String getDeptmenuid() {
		return deptmenuid;
	}

	public void setDeptmenuid(String deptmenuid) {
		this.deptmenuid = deptmenuid;
	}

	public String getMenuid() {
		return menuid;
	}

	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}

	public String getDeptid() {
		return deptid;
	}

	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}

}
