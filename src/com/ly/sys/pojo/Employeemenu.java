package com.ly.sys.pojo;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("employeemenu")
public class Employeemenu {

	@Name
	@Column
	private String employeemenuid;

	@Column
	private String employeeid;

	@Column
	private String menuid;

	public String getEmployeemenuid() {
		return employeemenuid;
	}

	public void setEmployeemenuid(String employeemenuid) {
		this.employeemenuid = employeemenuid;
	}

	public String getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}

	public String getMenuid() {
		return menuid;
	}

	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}

}
