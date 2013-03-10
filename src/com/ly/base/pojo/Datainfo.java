package com.ly.base.pojo;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Readonly;
import org.nutz.dao.entity.annotation.Table;

@Table("datainfo")
public class Datainfo {

	@Name
	@Column
	private String datainfoid;
	
	@Column
	private String dataclassid;
	
	@Column
	@Readonly
	private String dataclassname;
	

	@Column
	private String datainfono;

	@Column
	private String name;

	@Column
	private String dataurl;

	@Column
	private Date adddate;

	@Column
	private Integer state;

	@Column
	private Integer ordernum;

	public String getDatainfoid() {
		return datainfoid;
	}
	
	public void setDatainfoid(String datainfoid) {
		this.datainfoid = datainfoid;
	}
	
	public String getDatainfono() {
		return datainfono;
	}

	public void setDatainfono(String datainfono) {
		this.datainfono = datainfono;
	}


	public String getDataclassid() {
		return dataclassid;
	}

	public void setDataclassid(String dataclassid) {
		this.dataclassid = dataclassid;
	}

	public String getDataclassname() {
		return dataclassname;
	}

	public void setDataclassname(String dataclassname) {
		this.dataclassname = dataclassname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDataurl() {
		return dataurl;
	}

	public void setDataurl(String dataurl) {
		this.dataurl = dataurl;
	}

	public Date getAdddate() {
		return adddate;
	}

	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(Integer ordernum) {
		this.ordernum = ordernum;
	}

}
