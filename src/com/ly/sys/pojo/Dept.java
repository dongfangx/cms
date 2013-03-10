package com.ly.sys.pojo;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("dept")
public class Dept{


	@Name
	@Column
	private String  deptid;
	
	@Column
	private String  pdeptid;
	
	@Column
	private String  pdeptname;
	
	@Column
	private String  deptno;
	
	@Column
	private String  deptname;
	
	@Column
	private String  code;
	
	@Column
	private Long  state;
	
	@Column
	private String  memo;
	
		public String getDeptid() {
	return deptid;
	}

	public void setDeptid(String  deptid) {
	this.deptid = deptid;
	}

	public String getPdeptid() {
	return pdeptid;
	}

	public void setPdeptid(String  pdeptid) {
	this.pdeptid = pdeptid;
	}

	public String getPdeptname() {
	return pdeptname;
	}

	public void setPdeptname(String  pdeptname) {
	this.pdeptname = pdeptname;
	}

	public String getDeptno() {
	return deptno;
	}

	public void setDeptno(String  deptno) {
	this.deptno = deptno;
	}

	public String getDeptname() {
	return deptname;
	}

	public void setDeptname(String  deptname) {
	this.deptname = deptname;
	}

	public String getCode() {
	return code;
	}

	public void setCode(String  code) {
	this.code = code;
	}

	public Long getState() {
	return state;
	}

	public void setState(Long  state) {
	this.state = state;
	}

	public String getMemo() {
	return memo;
	}

	public void setMemo(String  memo) {
	this.memo = memo;
	}

}

