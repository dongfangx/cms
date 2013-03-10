package com.ly.base.pojo;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("info")
public class Info{


	@Name
	@Column
	private String  infoid;
	
	@Column
	private String  infono;
	
	@Column
	private Integer  state;
	
	@Column
	private Integer  ordernum;
	
	@Column
	private Date  adddate;
	
	@Column
	private String  title;
	
	@Column
	private String  content;
	
		public String getInfoid() {
	return infoid;
	}

	public void setInfoid(String  infoid) {
	this.infoid = infoid;
	}

	public String getInfono() {
	return infono;
	}

	public void setInfono(String  infono) {
	this.infono = infono;
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

	public Date getAdddate() {
	return adddate;
	}

	public void setAdddate(Date  adddate) {
	this.adddate = adddate;
	}

	public String getTitle() {
	return title;
	}

	public void setTitle(String  title) {
	this.title = title;
	}

	public String getContent() {
	return content;
	}

	public void setContent(String  content) {
	this.content = content;
	}

}

