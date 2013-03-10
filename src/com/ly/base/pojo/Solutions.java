package com.ly.base.pojo;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("solutions")
public class Solutions{


	@Name
	@Column
	private String  solutionsid;
	
	@Column
	private String  solutionsno;
	
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
	private String introducation;
	
	@Column
	private String  content;
	
	@Column
	private String  img;
	
		public String getSolutionsid() {
	return solutionsid;
	}

	public void setSolutionsid(String  solutionsid) {
	this.solutionsid = solutionsid;
	}

	public String getSolutionsno() {
	return solutionsno;
	}

	public void setSolutionsno(String  solutionsno) {
	this.solutionsno = solutionsno;
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
	
	

	public String getIntroducation() {
		return introducation;
	}

	public void setIntroducation(String introducation) {
		this.introducation = introducation;
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

