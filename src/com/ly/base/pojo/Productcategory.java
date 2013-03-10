package com.ly.base.pojo;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("productcategory")
public class Productcategory{


	@Name
	@Column
	private String  productcategoryid;
	
	@Column
	private String  productcategoryno;
	
	@Column
	private Integer  state;
	
	@Column
	private Integer  ordernum;
	
	@Column
	private Date  adddate;
	
	@Column
	private String  name;
	
		public String getProductcategoryid() {
	return productcategoryid;
	}

	public void setProductcategoryid(String  productcategoryid) {
	this.productcategoryid = productcategoryid;
	}

	public String getProductcategoryno() {
	return productcategoryno;
	}

	public void setProductcategoryno(String  productcategoryno) {
	this.productcategoryno = productcategoryno;
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

	public String getName() {
	return name;
	}

	public void setName(String  name) {
	this.name = name;
	}

}

