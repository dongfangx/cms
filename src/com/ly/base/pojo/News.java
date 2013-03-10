package com.ly.base.pojo;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("news")
public class News{


	@Name
	@Column
	private String  newsid;
	
	@Column
	private String  newsno;
	
	@Column
	private Integer  state;
	
	@Column
	private Integer  ordernum;
	
	@Column
	private Date  adddate;
	
	@Column
	private String  employeeid;
	
	@Column
	private String  title;
	
	@Column
	private String  content;
	
	@Column
	private String  img;
	
		public String getNewsid() {
	return newsid;
	}

	public void setNewsid(String  newsid) {
	this.newsid = newsid;
	}

	public String getNewsno() {
	return newsno;
	}

	public void setNewsno(String  newsno) {
	this.newsno = newsno;
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

	public String getEmployeeid() {
	return employeeid;
	}

	public void setEmployeeid(String  employeeid) {
	this.employeeid = employeeid;
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

	public String getImg() {
	return img;
	}

	public void setImg(String  img) {
	this.img = img;
	}

}

