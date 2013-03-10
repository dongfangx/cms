package com.ly.base.pojo;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("dataclass")
public class Dataclass{


	@Name
	@Column
	private String  dataclassid;
	
	@Column
	private String  dataclassno;
	
	@Column
	private String  name;
	
	@Column
	private Integer  state;
	
	@Column
	private Integer  ordernum;
	
		public String getDataclassid() {
	return dataclassid;
	}

	public void setDataclassid(String  dataclassid) {
	this.dataclassid = dataclassid;
	}

	public String getDataclassno() {
	return dataclassno;
	}

	public void setDataclassno(String  dataclassno) {
	this.dataclassno = dataclassno;
	}

	public String getName() {
	return name;
	}

	public void setName(String  name) {
	this.name = name;
	}

	public Integer getState() {
	return state;
	}

	public void setState(Integer  state) {
	this.state = state;
	}

	public Integer getOrdernum() {
	return ordernum;
	}

	public void setOrdernum(Integer  ordernum) {
	this.ordernum = ordernum;
	}

}

